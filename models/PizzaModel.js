module.exports = (_db)=>{
    db = _db;
    return PizzaModel;
}

class PizzaModel {
    // récupération des pizza
    static getAllPizzas() {
        return db.query('SELECT * FROM pizzas')
            .then((response)=>{
                return response;
            })
            .catch((err)=>{
                return err;
            })
    }
    
    // récupération d'une pizza en fonction de son id
    static getOnePizzas(id) {
        return db.query('SELECT * FROM pizzas WHERE id = ?', [id])
            .then((response)=>{
                return response;
            })
            .catch((err)=>{
                return err;
            })
    }
    
    // sauvegarde d'une pizza
    static saveOnePizza(req){
        return db.query('INSERT INTO pizzas (name, ingredient, price, photo, quantity, creationTimestamp) VALUES (?,?,?,?,?, NOW())', [req.body.name, req.body.ingredient, req.body.price, req.body.photo, req.body.quantity ])
            .then((response)=>{
                return response;
            })
            .catch((err)=>{
                return err;
            })
    }
    
    // modification d'une pizza
    static updateOnePizzas(req, id) {
        return db.query('UPDATE pizzas SET name= ?, ingredient=?, price=?, photo=?, quantity=? WHERE id = ?', [req.body.name, req.body.ingredient, req.body.price, req.body.photo, req.body.quantity, id])
            .then((response)=>{
                return response;
            })
            .catch((err)=>{
                return err;
            })
    }
    
    // suppression d'une pizza
    static deleteOnePizzas(id) {
        return db.query('DELETE FROM pizzas WHERE id = ?', [id])
            .then((response)=>{
                return response;
            })
            .catch((err)=>{
                return err;
            })
        
    }
}