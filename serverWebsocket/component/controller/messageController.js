const Message = require("../model/message");

class messageController {
  async addMessage(req, res) {
    const { message, user, room } = req.body;
    if (!message) {
      return res
        .status(400)
        .json({ success: false, message: "input name is required" });
    } else {
      const createM = await Message({
        message: message,
        user: user,
        room: room,
      });
      await createM.save();
      return res.status(200).json({ success: true, MessageCreate: createM });
    }
  }
}
module.exports = new messageController();
