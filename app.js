// Load modules mount -t vboxsf datingapp ~/new
var path = require('path'), // core
    express = require('express'),
    bodyParser = require('body-parser'),
    mysql = require('mysql'),
    myConnection = require('express-myconnection'),
    session = require('express-session'),
    sha1 = require('sha1'),
    multer = require('multer'),
    fs = require('fs');

var app = express();


//view engine set up
  app.use(express.static('public'))
  //app.set('views', 'views');
  app.set('views', path.join(__dirname, 'views'));
  app.set('view engine', 'ejs');


// Define bodyparser (handles POST requests)
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));


// Define upload dir
var upload = multer({dest: 'public/uploads/'});
// geef de form input name op
app.use(upload.single('bs-file'));

app.use(myConnection(mysql, {
  host: 'localhost',
  user: 'student',
  password: 'serverSide',
  port: 3306,
  database: 'datingapp'
}, 'single'));

// initialiseer sessies
app.use(session({
    secret: "YourSuperSecretStringWithStrangeCharacters#@dasf$!",
    resave: false,
    saveUninitialized: true
}));

app.get("/", function(req, res){
  if(req.session.ingelogd != true){
    res.render("index");
  } else {
    res.redirect("/home/");
  }
});


app.get("/users/", function(req, res){
    if(req.session.ingelogd == true){
      res.render("users/index");
    } else {
      res.redirect("/users/login/");
  }
});

app.get("/home/", function(req, res){
  if(req.session.ingelogd == true){
    req.getConnection(function(err, connection){
        if(err) return next(err);
        connection.query(`SELECT gebruiker.* FROM gebruiker WHERE (favartist1 = "${req.session.user.favartist1}" OR favartist2 = "${req.session.user.favartist1}" OR favartist3 = "${req.session.user.favartist1}" OR favartist1 = "${req.session.user.favartist2}" OR favartist2 = "${req.session.user.favartist2}" OR favartist3 = "${req.session.user.favartist2}" OR favartist1 = "${req.session.user.favartist3}" OR favartist2 = "${req.session.user.favartist3}" OR favartist3 = "${req.session.user.favartist3}") AND id != ${req.session.user.ID} AND geslacht = "${req.session.user.zoekgeslacht}" `, function(err, result) {
        //connection.query(`SELECT gebruiker.* FROM gebruiker WHERE (favartist1 = "${req.session.user.favartist1}" OR favartist2 = "${req.session.user.favartist1}" OR favartist3 = "${req.session.user.favartist1}" OR favartist1 = "${req.session.user.favartist2}" OR favartist2 = "${req.session.user.favartist2}" OR favartist3 = "${req.session.user.favartist2}") AND id != ${req.session.user.ID} `, function(err, result) {
          if(err) return next(err);
          //console.log(result);
          res.locals.user = req.session.user;
          res.locals.users = result;
          res.render("home/index");
        });
    });

  } else {
      res.redirect("/users/login");
  }
});

app.get("/users/login", function(req, res){
  if(req.session.ingelogd != true){
      res.render("users/login");
  } else {
      res.redirect("/home/index");
  }
});

app.post("/users/login", function(req, res){
    req.getConnection(function(err, connection){
        if(err) return next(err);
        connection.query('SELECT gebruiker.* FROM gebruiker WHERE email=? AND wachtwoord=?', [req.body.username, sha1(req.body.password)], function(err, result) {
          //console.log(result[0]);
          if(result[0]){
              req.session.user = result[0];
              req.session.ingelogd = true;
              res.redirect("/");
          } else{
              res.send("Gebruikersnaam en wachtwoord zijn niet geldig.");
          }
        });
    });
});

app.get("/users/wachtwoordvergeten", function(req, res){
  if(req.session.ingelogd != true){
      res.render("users/wachtwoordvergeten");
  } else {
      res.redirect("/home/");
  }
});

app.post("/users/wachtwoordvergeten", function(req, res){
    req.getConnection(function(err, connection){
        if(err) return next(err);
        connection.query('SELECT gebruiker.* FROM gebruiker WHERE email=? AND postcode=?', [req.body.username, req.body.postcodecontrole], function(err, result) {
          //console.log(result);
          if(result[0]){
              connection.query('UPDATE gebruiker SET wachtwoord=? WHERE email=? AND postcode=?', [sha1(req.body.password), req.body.username, req.body.postcodecontrole], function(err, result) {
                res.redirect("/");
              });
          } else{
              res.send("Email en postcode zijn niet geldig.");
          }
        });
    });
});

app.get("/users/register", function(req, res){
  if(req.session.ingelogd != true){
      res.render("users/register");
  } else {
      res.redirect("/home/");
  }
});

app.post("/users/register", function(req, res){
  req.getConnection(function(err, connection){
      if(err) return next(err);
      if(req.file !== undefined) {
        fs.rename(req.file.path, req.file.destination + req.file.originalname, function(err){
          if(err) return next(err);
        });
      }
      var user = {
        voornaam : req.body.voornaam,
        achternaam : req.body.achternaam,
        geslacht : req.body.geslacht,
        profielfoto: "uploads/" + req.file.originalname,
        geboortedatum : req.body.geboortedatum,
        email : req.body.email,
        wachtwoord : sha1(req.body.wachtwoord),
        postcode : req.body.postcode,
        huisnummer : req.body.huisnummer,
        zoekleeftijdmin :  req.body.zoekleeftijdmin,
        zoekleeftijdmax : req.body.zoekleeftijdmax,
        zoekgeslacht : req.body.zoekgeslacht,
        zoekafstand : req.body.zoekafstand,
        favartist1: req.body.favartiest1,
        favartist2: req.body.favartiest2,
        favartist3: req.body.favartiest3
      };
      console.log(user);
      connection.query('INSERT INTO gebruiker set ?', [user], function(err, result) {
          //console.log(user);
          //console.log(err);
          res.redirect("/users/login")
      });
  });
});

app.get("/users/edit", function(req, res){
  if(req.session.ingelogd != true){
      res.redirect("/");
  } else {
    res.render("users/edit");
  }
});

app.post("/users/edit", function(req, res){

  req.getConnection(function(err, connection){
      if(err) return next(err);
      var user = {
        voornaam : req.body.voornaam,
        achternaam : req.body.achternaam,
        geslacht : req.body.geslacht,
        geboortedatum : req.body.geboortedatum,
        email : req.body.email,
        wachtwoord : sha1(req.body.wachtwoord),
        postcode : req.body.postcode,
        huisnummer : req.body.huisnummer,
        zoekleeftijdmin :  req.body.zoekleeftijdmin,
        zoekleeftijdmax : req.body.zoekleeftijdmax,
        zoekgeslacht : req.body.zoekgeslacht,
        zoekafstand : req.body.zoekafstand,
        huidigwachtwoord : sha1(req.body.huidigwachtwoord)
      }

      if(user.voornaam != "" && user.achternaam){
        connection.query('UPDATE gebruiker SET voornaam=?, achternaam=? WHERE ID=? AND wachtwoord=?', [user.voornaam, user.achternaam, req.session.user.ID, user.huidigwachtwoord], function(err, result) {
          res.render("users/");
        });
      }

      if(user.geboortedatum != ""){
        connection.query('UPDATE gebruiker SET geboortedatum=? WHERE ID=? AND wachtwoord=?', [user.geboortedatum, req.session.user.ID, user.huidigwachtwoord], function(err, result) {
          res.render("users/");
        });
      }


      if(user.email != ""){
        connection.query('UPDATE gebruiker SET email=? WHERE ID=? AND wachtwoord=?', [user.email, req.session.user.ID, user.huidigwachtwoord], function(err, result) {
          res.render("users/");
        });
      }

      if(user.wachtwoord != ""){
        connection.query('UPDATE gebruiker SET email=? WHERE ID=? AND wachtwoord=?', [user.wachtwoord, req.session.user.ID, user.huidigwachtwoord], function(err, result) {
          res.render("users/");
        });
      }

      if(user.postcode != "" && user.huisnummer){
        connection.query('UPDATE gebruiker SET postcode=?, huisnummer=? WHERE ID=? AND wachtwoord=?', [user.postcode, user.huisnummer, req.session.user.ID, user.huidigwachtwoord], function(err, result) {
          res.render("users/");
        });
      }

      if(user.zoekleeftijdmin != "" && user.zoekleeftijdmax && user.zoekgeslacht && user.zoekafstand){
        connection.query('UPDATE gebruiker SET zoekleeftijdmin=?, zoekleeftijdmax=?, zoekgeslacht=?, zoekafstand=? WHERE ID=? AND wachtwoord=?', [user.zoekleeftijdmin, user.zoekleeftijdmax, user.zoekgeslacht, user.zoekafstand, req.session.user.ID, user.huidigwachtwoord], function(err, result) {
          res.render("users/");
        });
      }

  });
});

app.get('/users/logout', function(req, res){
    req.session.destroy(function(){
        res.redirect("/");
    });
});

app.get('/admin', function(req, res) {
  if (req.session.admin){
    req.getConnection(function(err, connection){
      if(err) return next(err);
      connection.query(`SELECT gebruiker.* FROM gebruiker`, function(err, result) {
        if(err) return next(err);
        res.locals.users = result;
        res.render("admin/index.ejs");
      });
    });
  }else {
    res.redirect("/admin/login");
  }
});

app.get('/admin/login', function(req, res){
  if (req.session.admin){res.redirect('/');}else {
    res.render("admin/login");
  }
});

app.post('/admin/login', function(req, res){
  req.getConnection(function(err, connection){
      if(err) return next(err);
      connection.query(`SELECT admin.* FROM admin WHERE gebruikersnaam = "${req.body.username}" AND wachtwoord = "${sha1(req.body.password)}"`, function(err, result) {
        if(err) return next(err);
        if(result[0]){
            req.session.admin = result[0];
            res.redirect("/admin");
        } else{
            res.send("Gebruikersnaam en wachtwoord zijn niet geldig.");
        }
      });
  });
});

app.get("/admin/remove", function(req, res){
  var user = req.query.id;
  req.getConnection(function(err, connection){
		connection.query(`DELETE FROM gebruiker WHERE id = ${req.query.id}`, function(err,result) {
			console.log(result);
      res.send("verwijdert.");
		});
	});
});

app.get("/api", function(req, res){
  req.getConnection( function(err, connection){
    if(err) return next(err);
    if(req.query.firstname != ""){
      connection.query( `SELECT gebruiker.voornaam FROM gebruiker WHERE voornaam LIKE   "${req.query.firstname}%"`, function(err, result) {
        if(result.length>0) {
          result = result.splice(0,10);
          result.unshift({status : 'ok'});
        //  console.log(result);
          res.json(result);
        }else {
          result[0] = {status: "error"};
          res.json(result);
        }
      });
    }else {
      var result = [{status: "error"}];
      res.json(result);
    }
  });
});



// Start the server
app.listen(3000, function(){
  console.log('App listening at http://192.168.56.101:3000');
});
