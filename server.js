const express = require("express");
const app = express();

const https = require("https");
const fs = require("fs");
const options = {
  key: fs.readFileSync("./privkey.pem"),
  cert: fs.readFileSync("./fullchain.pem"),
};

const mysql = require("promise-mysql");
const cors = require("cors");
app.use(cors());
const fileUpload = require("express-fileupload");
app.use(
  fileUpload({
    createParentPath: true,
  })
);

//parse les url
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.static(__dirname + "/public"));

//middleware: une fonction qu'on va par la suite utiliser dans nos routes api pour controller si l'utilisateur peut executer le code de la route ou non (ici ce sera le fichier withAuth pour vérifier l'authentification de l'utilisateur)

//test de middleware
const myModule = require("./testModule");
myModule();

//on check si il l'api est en ligne ou non et on décide quelle bdd on récupère
if (!process.env.HOST_DB) {
  var config = require("./config");
}

//récup de toutes mes routes
const pizzaRoutes = require("./routes/pizzaRoutes");
const userRoutes = require("./routes/userRoutes");
const authRoutes = require("./routes/authRoutes");
const orderRoutes = require("./routes/orderRoutes");

// connexion BDD
const host = process.env.HOST_DB || config.db.host;
const database = process.env.DATABASE_DB || config.db.database;
const user = process.env.USER_DB || config.db.user;
const password = process.env.PASSWORD_DB || config.db.password;
const port = process.env.PORT_DB || config.db.port;

console.log(host, database, user, password, port);

mysql
  .createConnection({
    host: host,
    database: database,
    user: user,
    password: password,
    port: port,
  })
  .then((db) => {
    console.log("DB is connected");
    setInterval(async function () {
      let res = await db.query("SELECT 1");
    }, 10000);

    app.get("/", (req, res, next) => {
      res.json({ status: 200, results: "welcome to api" });
    });

    // toutes les routes sont dans des modules
    pizzaRoutes(app, db);
    userRoutes(app, db);
    authRoutes(app, db);
    orderRoutes(app, db);
  })
  .catch((err) => console.log("Echec connexion BDD: ", err));

const PORT = process.env.PORT || 3500;
/*app.listen(PORT, () => {
  console.log("listening port " + PORT + " all is ok");
});*/

https.createServer(options, app).listen(PORT, function () {
  console.log("listening port " + PORT + " all is ok");
});
