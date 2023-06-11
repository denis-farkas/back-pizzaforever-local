const jwt = require("jsonwebtoken");
const secret = "moi";

const withAuth = (req, res, next) => {
    //on récupère notre token dans le header de la requète HTTP
    const token = req.headers["x-access-token"];
    console.log("token", token);
    //si il ne le trouve pas
    if (token === undefined) {
        //renvoi d'une erreur
        res.json({
            status: 404,
            msg: "token not found",
        });
    } else {
        //sinon (trouvé) utilisation de la fonction de vérification de jsonwebtoken.
        jwt.verify(token, secret, async (err, decoded) => {
            //si il y'a une erreur envoi d'une rep d'erreur
            if (err) {
                res.json({
                    status: 401,
                    msg: "error, your token is invalid",
                });
                //sinon envoi de l'id décodé dans le payload du token
            } else {
                req.id = decoded.id;
                const UserModel = require("./models/UserModel")(db);
                let user = await UserModel.getOneUser(req.id);
                if (user && user.length === 1) {
                    let data = Object.values(JSON.parse(JSON.stringify(user)));
                    req.role = data[0].role;
                }
                console.log(req.role);
                //on sort de la fonction
                next();
            }
        });
    }
};

module.exports = withAuth;
