const messageController = require('../controller/messageController')

const router = require('express').Router()

router.post("/",messageController.addMessage)

module.exports = router