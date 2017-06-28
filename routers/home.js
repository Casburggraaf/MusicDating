// routers/hello.js
var express = require('express');
var router = express.Router();

router.get("/", function(req, res){
  console.log(req.session.user);
  if(req.session.ingelogd == true){
    req.getConnection(function(err, connection){
        if(err) return next(err);
        connection.query(`SELECT gebruiker.* FROM gebruiker WHERE (favartist1 = "${req.session.user.favartist1}" OR favartist2 = "${req.session.user.favartist1}" OR favartist3 = "${req.session.user.favartist1}" OR favartist1 = "${req.session.user.favartist2}" OR favartist2 = "${req.session.user.favartist2}" OR favartist3 = "${req.session.user.favartist2}" OR favartist1 = "${req.session.user.favartist3}" OR favartist2 = "${req.session.user.favartist3}" OR favartist3 = "${req.session.user.favartist3}") AND id != ${req.session.user.ID}`, function(err, result) {
        //connection.query(`SELECT gebruiker.* FROM gebruiker WHERE (favartist1 = "${req.session.user.favartist1}" OR favartist2 = "${req.session.user.favartist1}" OR favartist3 = "${req.session.user.favartist1}" OR favartist1 = "${req.session.user.favartist2}" OR favartist2 = "${req.session.user.favartist2}" OR favartist3 = "${req.session.user.favartist2}") AND id != ${req.session.user.ID} `, function(err, result) {
          if(err) return next(err);
          res.locals.user = req.session.user;
          res.locals.users = result;
          res.render("home/index");
        });
    });

  } else {
      res.redirect("/users/login");
  }
});

router.get("/chat", function(req, res){
  if(req.session.ingelogd == true){
    req.getConnection(function(err, connection){
      if(err) return next(err);
      connection.query(`SELECT gebruiker.* FROM gebruiker WHERE ID=${req.query.id}; SELECT chats.* FROM chats WHERE (verzenderID=${req.query.id} OR ontvangerID=${req.query.id}) AND (verzenderID=${req.session.user.ID} OR ontvangerID=${req.session.user.ID})`, function(err, result) {
        res.locals.user = req.session.user;
        res.locals.match = result[0][0];
        res.locals.chats = result[1];
        res.render("home/chat");
      });
    });
  } else {
      res.redirect("/users/login");
  }
});


router.post("/chat", function(req, res){
  var ontvangerID = req.header('Referer');
  var ontvangerID = ontvangerID.split("=").slice(-1)[0];
  console.log(req.query.id);
  console.log(ontvangerID);
  console.log(req.body.bericht);
  console.log(req.session.user.ID);
  req.getConnection(function(err, connection){
    if(err) return next(err);
    connection.query(`INSERT INTO chats (verzenderID, ontvangerID, bericht) VALUES ('${req.session.user.ID}', '${ontvangerID}', '${req.body.bericht}')`, function(err, result) {
      console.log(err);
      res.redirect(`chat?=${ontvangerID}`);
    });
  });
});
module.exports = router;
