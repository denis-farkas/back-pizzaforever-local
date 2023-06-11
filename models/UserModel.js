const bcrypt = require("bcrypt");
const saltRounds = 10;

module.exports = (_db) => {
    db = _db;
    return UserModel;
};

class UserModel {
    // sauvegarde d'un membre
    static saveOneUser(req) {
        return bcrypt
            .hash(req.body.password, saltRounds)
            .then((hash) => {
                return db
                    .query(
                        'INSERT INTO users (firstName, lastName, email, password, role, address, zip, city, phone, creationTimestamp, connexionTimestamp) VALUES (?, ?, ?, ?, "user", ?, ?, ?, ?, NOW(), NOW())',
                        [
                            req.body.firstName,
                            req.body.lastName,
                            req.body.email,
                            hash,
                            req.body.address,
                            req.body.zip,
                            req.body.city,
                            req.body.phone,
                        ]
                    )
                    .then((response) => {
                        return response;
                    })
                    .catch((err) => {
                        return err;
                    });
            })
            .catch((err) => console.log("Failing to hash password"));
    }

    // récupération d'un utilisateur en fonction de son mail
    static getUserByEmail(email) {
        return db
            .query("SELECT * FROM users WHERE email = ?", [email])
            .then((response) => {
                console.log("getUserByEmail", response);
                return response;
            })
            .catch((err) => {
                return err;
            });
    }

    // récupération d'un utilisateur en fonction de son id
    static getOneUser(id) {
        return db
            .query("SELECT * FROM users WHERE id= ?", [id])
            .then((user) => {
                if (user.length === 0) {
                    return {
                        status: 401,
                        error: "email incorrect",
                    };
                } else {
                    return user;
                }
            })
            .catch((err) => {
                return err;
            });
    }

    //modification d'un user firstName, lastName, address, zip, city, phone
    static updateUser(req, userId) {
        return db
            .query(
                "UPDATE users SET firstName=?,lastName=?, address=?,zip=?,city=?,phone= ? WHERE id=?",
                [
                    req.body.firstName,
                    req.body.lastName,
                    req.body.address,
                    req.body.zip,
                    req.body.city,
                    req.body.phone,
                    userId,
                ]
            )
            .then((response) => {
                return response;
            })
            .catch((err) => {
                return err;
            });
    }
}
