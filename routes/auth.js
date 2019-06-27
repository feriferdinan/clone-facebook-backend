const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const config = require('../config');



const router = express.Router();
const app = express();

const model = require('../models/index');

app.use(bodyParser.json())

router.post("/signin",  (req,res) => {
    let {email, password} = req.body;
    console.log(req.body)
    model.users.findOne({
            where : {
                email : email
            }
        }).then(result => {
            bcrypt.compare(password, result.password).then((valid) => {
                console.log(valid)
                if(!valid){
                    res.status(400).send({
                        "messages" : "password is incorrect",
                        "data" : {}
                    })
                }else{
                    res.status(200).send({
                        "messages" : "all done",
                        "data" : result
                    })
                }
            })
        }).catch(err => {
                res.status(400).send({
                  "messages" : err.messages,
                  "data" : {}
                })
             })
})

router.post('/create/authorization',(req, res) => {
    let {user_id,email, name} = req.body;
    
    jwt.sign({user_id:user_id,email : email, name : name},config.secret,(err, token) => {
        if(err){
            res.status(400).send({
                "status" : "ERROR",
                "message" : err,
                "data" : {token : null}
            });
            console.log(err);
        }else{
            res.status(200).send({
                "status" : "OK",
                "message" : "token successfully created",
                "data" : {token : token}
            })
        }
    })


});

module.exports = router;