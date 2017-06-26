// routers/hello.js
var express = require('express');
var router = express.Router();

var sha1 = require('sha1'),
    fs = require('fs');

router.get("/", function(req, res){
    if(req.session.ingelogd == true){
      res.render("users/index");
    } else {
      res.redirect("/users/login/");
  }
});

router.get("/login", function(req, res){
  if(req.session.ingelogd != true){
      res.render("users/login");
  } else {
      res.redirect("/home/");
  }
});

router.post("/login", function(req, res){
    req.getConnection(function(err, connection){
        if(err) return next(err);
        connection.query('SELECT gebruiker.* FROM gebruiker WHERE email=? AND wachtwoord=?', [req.body.username, sha1(req.body.password)], function(err, result) {
          //console.log(result[0]);
          if(result[0]){
              req.session.user = result[0];
              req.session.ingelogd = true;
              res.redirect("/");
          } else{
              res.render("users/wachtwoordverkeerd");
          }
        });
    });
});

router.get("/wachtwoordvergeten", function(req, res){
  if(req.session.ingelogd != true){
      res.render("users/wachtwoordvergeten");
  } else {
      res.redirect("/home/");
  }
});

router.post("/wachtwoordvergeten", function(req, res){
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

router.get("/register", function(req, res){
  if(req.session.ingelogd != true){
      res.render("users/register");
  } else {
      res.redirect("/home/");
  }
});

router.post("/register", function(req, res){
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

router.get("/edit", function(req, res){
  if(req.session.ingelogd != true){
      res.redirect("/");
  } else {
    res.render("users/edit");
  }
});

router.post("/edit", function(req, res){

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

router.get('/logout', function(req, res){
    req.session.destroy(function(){
        res.redirect("/");
    });
});


module.exports = router;
