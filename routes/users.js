var express = require('express');
var router = express.Router();
var cors = require('cors')
var app = express()
app.use(cors())

var model = require('../models/index')
const sef = require(`sequelize-express-findbyid`)
const findById = sef(model) // Primary key is 'id'
const findByOtherId = sef(model, 'OtherId')
const bcrypt = require('bcrypt');

var bodyParser = require('body-parser');

var salt = bcrypt.genSaltSync(10);

app.use(bodyParser.json());

/* GET users listing. */
router.get('/', async function (req, res, next) {
  try {
    const users = await model.users.findAll({});
    if (users.length !== 0) {
      res.json({
        'status': 'OK',
        'messages': '',
        'data': users
      })
    } else {
      res.json({
        'status': 'ERROR',
        'messages': 'EMPTY',
        'data': {}
      })
    }
  } catch (err) {
    res.json({
      'status': 'ERROR',
      'messages': err.messages,
      'data': {}
    })
  }
});
router.get('/:id', async  function (req, res, next) {
  try {
    const users = await model.users.findByPk(req.params.id)
    if (users.length !== 0) {
      res.json({
        'status': 'OK',
        'messages': '',
        'data': users
      })
    } else {
      res.json({
        'status': 'ERROR',
        'messages': 'EMPTY',
        'data': {}
      })
    }
  } catch (err) {
    res.json({
      'status': 'ERROR',
      'messages': err.messages,
      'data': {}
    })
  }
});

router.post('/', async function (req, res, next) {
  try {
    console.log(req.body)
    const {
      name,
      email,
      password ,
      phone_number,
      gender,
      avatar
    } = req.body;
    
   var hash = bcrypt.hashSync(password, salt)
    const users = await model.users.create({
      name,
      email,
      password :hash ,
      phone_number,
      gender,
      avatar
    });
  if (users) {
    res.status(201).json({
      'status': 'OK',
      'messages': 'User berhasil ditambahkan',
      'data': users,
    })
  }
 } catch (err) {
   res.status(400).json({
     'status': 'ERROR',
     'messages': err.message,
     'data': {},
   })
 }
});

router.patch('/:id', async function (req, res, next) {
  try {
    const usersId = req.params.id;
    const {
      name,
      email,
      password,
      phone_number,
      gender,
      avatar
    } = req.body;
    var hash = bcrypt.hashSync(password, salt)
    const users = await model.users.update({
      name,
      email,
      password:hash,
      phone_number,
      gender,
      avatar
    }, {
      where: {
        id: usersId
      }
    });
    if (users) {
      res.json({
        'status': 'OK',
        'messages': 'User berhasil diupdate',
        'data': users,
      })
    }
  } catch (err) {
    res.status(400).json({
      'status': 'ERROR',
      'messages': err.message,
      'data': {},
    })
  }
});
router.delete('/:id', async function (req, res, next) {
  try {
    const users = await model.users.destroy({ where: {
      id: req.params.id
    }})
    if (users) {
      res.json({
        'status': 'OK',
        'messages': 'User berhasil dihapus'
      })
    }
  } catch (err) {
    res.status(400).json({
      'status': 'ERROR',
      'messages': err.message
    })
  }
});
module.exports = router;
