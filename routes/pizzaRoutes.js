const fs = require("fs");
const withAuth = require("../withAuth");

module.exports = (app, db) => {
    const pizzaModel = require("../models/PizzaModel")(db);
    // route permettant de récupérer toutes les pizza
    app.get("/api/v1/pizza/all", async (req, res, next) => {
        let pizzas = await pizzaModel.getAllPizzas();

        if (pizzas.code) {
            res.json({ status: 500, msg: "il y a eu un problème !", result: pizzas });
        }

        res.json({ status: 200, result: pizzas });
    });

    // route permettant de récupérer une pizza en fonction de son id
    app.get("/api/v1/pizza/one/:id", async (req, res, next) => {
        let id = req.params.id;
        let pizza = await pizzaModel.getOnePizzas(id);
        if (pizza.code) {
            res.json({ status: 500, msg: "il y a eu un problème !", result: pizza });
        }
        res.json({ status: 200, result: pizza });
    });

    // route permettant d'enregister une pizza
    app.post("/api/v1/pizza/save", withAuth, async (req, res, next) => {
        if (!req.role || req.role !== "admin")
            return res.json({
                status: 401,
                msg: "Vous n'avez pas les droits pour effectuer cette action",
            });
        let pizza = await pizzaModel.saveOnePizza(req);
        if (pizza.code) {
            res.json({ status: 500, msg: "il y a eu un problème !", result: pizza });
        }
        res.json({ status: 200, msg: "la pizza a bien été enregistrée", result: pizza });
    });

    // route permettant d'enregister une photo une pizza
    app.post("/api/v1/pizza/pict", withAuth, async (req, res, next) => {
        if (!req.role || req.role !== "admin")
            return res.json({
                status: 401,
                msg: "Vous n'avez pas les droits pour effectuer cette action",
            });
        //si il n'y a aucune file envoyé ou que cette file est un objet vide on retourne une erreur
        if (!req.files || Object.keys(req.files).length === 0) {
            res.json({ status: 400, msg: "La photo n'a pas pu être récupérée" });
        }

        //on sauvegarde notre image dans le dossier que l'on souhaite
        req.files.image.mv("public/images/" + req.files.image.name, function (err) {
            console.log("saving: ", "/public/images/" + req.files.image.name);
            if (err) {
                res.json({ status: 500, msg: "La photo n'a pas pu être enregistrée" });
            }
        });

        res.json({ status: 200, msg: "ok", url: req.files.image.name });
    });

    // route permettant de modifier une pizza
    app.put("/api/v1/pizza/update/:id", withAuth, async (req, res, next) => {
        if (!req.role || req.role !== "admin")
            return res.json({
                status: 401,
                msg: "Vous n'avez pas les droits pour effectuer cette action",
            });
        let id = req.params.id;

        let pizza = await pizzaModel.updateOnePizzas(req, id);

        if (pizza.code) {
            res.json({ status: 500, msg: "il y a eu un problème !", result: pizza });
        }

        res.json({ status: 200, result: pizza });
    });

    //route pour supprimer une pizza
    app.delete("/api/v1/pizza/delete/:id", withAuth, async (req, res, next) => {
        if (!req.role || req.role !== "admin")
            return res.json({
                status: 401,
                msg: "Vous n'avez pas les droits pour effectuer cette action",
            });
        let id = req.params.id;
        //on récup les infos de la pizza à supprimer (pour récup le nom de l'image à suppr)
        let pizza = await pizzaModel.getOnePizzas(id);
        //on supprime l'annonce de notre bdd
        let deletePizza = await pizzaModel.deleteOnePizzas(id);
        if (deletePizza.code) {
            res.json({ status: 500, msg: "il y a eu un problème !", result: pizza });
        }
        // suppression des photos
        if (pizza[0].photo !== "no-pict.jpg") {
            fs.unlink("public/images/" + pizza[0].photo, function (err) {
                if (err) {
                    res.json({ status: 500, msg: "Gros problème" });
                }
            });
        }
        res.json({ status: 200, result: deletePizza });
    });
};
