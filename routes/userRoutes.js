const bcrypt = require("bcrypt");
const saltRounds = 10;
const jwt = require("jsonwebtoken");
const secret = "moi";
const withAuth = require("../withAuth");

module.exports = (app, db) => {
    const userModel = require("../models/UserModel")(db);

    app.get("/test", withAuth, (req, res, next) => {
        res.json({ status: 200, msg: "fake route testé!!!" });
    });
    // enregistrement d'un membre
    app.post("/api/v1/user/save", async (req, res, next) => {
        //on check si l'email existe déjà
        let check = await userModel.getUserByEmail(req.body.email);
        //si il existe
        if (check.length > 0) {
            //reponse json d'erreur
            if (check[0].email === req.body.email) {
                res.json({ status: 401, msg: "Email déjà utilisé!" });
            }
        }
        //on enregistre
        let user = await userModel.saveOneUser(req);

        if (user.code) {
            res.json({ status: 500, msg: "il y a eu un problème !", result: user });
        }

        res.json({ status: 200, msg: "l'utilisateur a bien été enregistré" });
    });

    // gestion de la connexion des membres (c'est ici qu'on va créer le token et l'envoyer vers le front)
    app.post("/api/v1/user/login", async (req, res, next) => {
        //on check si le mail de l'user correspond à un user de la bdd
        let user = await userModel.getUserByEmail(req.body.email);
        //si il renvoi un tableau vide (il n'existe pas)
        if (user.length === 0) {
            //on envoi une reponse d'erreur d'utilisateur innexistant
            res.json({ status: 404, msg: "Pas d'utilisateur avec ce mail" });
        }
        //on compare les deux mots de passes
        bcrypt
            .compare(req.body.password, user[0].password)
            .then((same) => {
                //si ça correspond
                if (same) {
                    //on va créer une const payload on stock les valeur qu'on va glisser dans le token (attention jamais d'infos sensibles)
                    const payload = { email: req.body.email, id: user[0].id };
                    //on crée le token avec sa signature secret
                    const token = jwt.sign(payload, secret);
                    console.log(token);
                    //reponse json avec le token qu'on renvoi vers le front
                    res.json({ status: 200, token: token, user_id: user[0].id });
                    //sinon
                } else {
                    //on envoi une reponse json negative 401 avec mot de pass incorrect
                    res.json({ status: 401, error: "Votre mot de passe est incorrect" });
                }
            })
            .catch((err) => {
                console.log("Echec comparaison mdp", err);
            });
    });

    //modification des utilisateurs (modif profil)
    app.put("/api/v1/user/update/:id", withAuth, async (req, res, next) => {
        let userId = req.params.id;

        if (req.params.id != req.id)
            res.json({ status: 401, msg: "Vous n'avez pas le droit de modifier ce profil" });

        //on modifie les infos de l'utilisateur
        let user = await userModel.updateUser(req, userId);

        if (user.code) {
            res.json({ status: 500, msg: "gros pb", err: user });
        }

        //on recup les infos d'un utilisateur
        let newUser = await userModel.getOneUser(userId);

        if (newUser.code) {
            res.json({ status: 500, msg: "gros pb", err: newUser });
        }

        //on retourne ces infos vers le front
        res.json({ status: 200, result: user, newUser: newUser[0] });
    });
};
