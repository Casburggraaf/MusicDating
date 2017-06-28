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

// Routers

var homeRouter = require('./routers/home'),
    usersRouter = require('./routers/users'),
    adminRouter = require('./routers/admin');


//view engine set up
app.use(express.static('public'))
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
  database: 'datingapp',
  multipleStatements: true
}, 'single'));

// initialiseer sessies
app.use(session({
    secret: "8D%_-!sh.A<Eebz$n:zgU7+jSC=HG!",
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

app.use('/home', homeRouter);

app.use('/users', usersRouter);

app.use('/admin', adminRouter);

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
