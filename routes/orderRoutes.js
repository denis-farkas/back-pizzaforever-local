const stripe = require('stripe')('sk_test_51GlyfBIITULt9LXjtAl0d5aB9dzyPtwT3DJUsm6OUxGOCUxpnFZYnkd9NXdru59ALUIbYNBoY4TMZGiQ8NzISynH0012EIzsig');
const withAuth = require('../withAuth');

module.exports = function (app, connection) {
    const orderModel = require('../models/OrderModel')(db);
	const pizzaModel = require('../models/PizzaModel')(db);
    
    //sauvegarde une commande
    app.post('/api/v1/order/save', withAuth, async (req, res, next)=>{
        let totalAmount = 0;
        //enregistrement de l'order
        let orderInfos = await orderModel.saveOneOrder(req.body.user_id, totalAmount)
        //on recup l'id généré par l'enregistrement de l'order insertId
        let id = orderInfos.insertId;
        
        //enregistrement des orderdetails
        req.body.basket.map(async (b, index)=>{
            //je récupère les infos de la pizza pour chaque tour de boucle
            let pizza = await pizzaModel.getOnePizzas(b.id);
            //je rajoute le prix dans l'objet de mon produit sur la boucle
            b.safePrice = parseFloat(pizza[0].price);
            //je sauvegarde la ligne de ce produit acheté
            let detail = await orderModel.saveOneOrderDetail(id, b);
            //j'ajoute le prix total pour ce produit
            totalAmount += parseInt(b.quantityInCart) * parseFloat(b.safePrice);
            //mise à jour du montant total de la commande
            let udpate = await orderModel.updateTotalAmount(id, totalAmount);
        })
        
        res.json({status: 200, orderId:id})
        
    })
    
    
    // gestion du paiement
    app.post('/api/v1/order/payment', withAuth, async (req, res, next)=>{
        //récup d'une commande
        let order = await orderModel.getOneOrder(req.body.orderId);
        //on lance un suivis du paiement
        const paymentIntent = await stripe.paymentIntents.create({
	        amount: order[0].totalAmount* 100,
	        currency: 'eur',
	        // Verify your integration in this guide by including this parameter
	        metadata: {integration_check: 'accept_a_payment'},
	        receipt_email: req.body.email,
	      });
        
        
        //res json le client secret du payment intent
        res.json({client_secret: paymentIntent['client_secret']})
    })
    
    
    // validation du paiement dans un order
    app.put('/api/v1/order/validate', withAuth, async (req, res, next)=>{
        
        let validate = await orderModel.updateStatus(req.body.orderId, req.body.status)
        if(validate.code){
            res.json({status:500, msg: "Status de la commande non modifiée", err: validate})
        }
		res.json({status: 200, msg: "paiement validé"})
    })
}        