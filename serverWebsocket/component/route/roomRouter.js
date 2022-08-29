const roomController = require("../controller/roomController");

const router = require("express").Router();
const verifyToken = require("../midleware/user");
router.post("/", roomController.createRoom);
router.post("/:id", roomController.DeletedRoom);

module.exports = router;
