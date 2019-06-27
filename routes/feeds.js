var express = require('express');
var router = express.Router();
var app = express();
var model = require('../models')
var users = require('../models').users
var bodyParser = require('body-parser');

app.use(bodyParser.json());

/* GET feeds listing. */
router.get('/', async function (req, res, next) {
  try {
    console.log(req.userData.user_id)
    const feeds = await model.feeds.findAll({
      order: [
        ['createdAt', 'DESC']
    ],
      include:users
    });
    if (feeds.length !== 0) {
      res.json({
        'status': res.status,
        'messages': '',
        'data': feeds
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
    
    const feeds = await model.feeds.findOne({where:{
       id:req.params.id
      }
    })
    if (feeds.length !== 0) {
      res.json({
        'status': 'OK',
        'messages': '',
        'data': feeds
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
    const body = {
		    user_id: req.userData.user_id,
        media: req.body.media,
        content: req.body.content
    } ;
    const feeds = await model.feeds.create(body);
  if (feeds) {
    res.status(201).json({
      'status': 'OK',
      'messages': 'User berhasil ditambahkan',
      'data': feeds,
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
    const feedsId = req.params.id;
    const body = {
        media: req.body.media,
        content: req.body.content
    } ;
    const feeds = await model.feeds.update(body, {
      where: {
        id: feedsId
      }
    });
    if (feeds) {
      res.json({
        'status': 'OK',
        'messages': 'User berhasil diupdate',
        'data': feeds,
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
    const feeds = await model.feeds.destroy({ where: {
      id: req.params.id
    }})
    if (feeds) {
      res.json({
        'status': 'OK',
        'messages': 'feeds berhasil dihapus',
        
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
module.exports = router;
