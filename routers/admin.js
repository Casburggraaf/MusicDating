var express = require('express');
var router = express.Router();

var sha1 = require('sha1');

router.get('/', function(req, res) {
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

router.get('/login', function(req, res){
  if (req.session.admin){res.redirect('/');}
  else {
    res.render("admin/login");
  }
});

router.post('/login', function(req, res){
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

router.get("/remove", function(req, res){
  if (req.session.admin){
    var user = req.query.id;
    if(req.query.id){
      req.getConnection(function(err, connection){
    		connection.query(`DELETE FROM chats WHERE verzenderID = ${req.query.id} OR ontvangerID = ${req.query.id}; DELETE FROM gebruiker WHERE id = ${req.query.id}`, function(err,result) {
    			console.log(result);
          res.locals.user = req.query.id;
          res.render("admin/verwijderd");
    		});
    	});
    }else if(req.query.voornaam){
      req.getConnection(function(err, connection){
    		connection.query(`DELETE FROM gebruiker WHERE voornaam = "${req.query.voornaam}"`, function(err,result) {
    			console.log(result);
          res.locals.user = req.query.voornaam;
          res.render("admin/verwijderd");
    		});
    	});
    }
  }else {res.redirect("admin/login");  }
});

module.exports = router;
