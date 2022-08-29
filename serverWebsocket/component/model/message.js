const mongoose = require("mongoose");
const schema = mongoose.Schema;

const messageSchamaModel = new schema({
  user: {
    type: schema.Types.ObjectId,
    ref: "users",
  },
  room: {
    type: schema.Types.ObjectId,
    ref: "rooms",
  },
  message: {
    type: String,
  },
});
module.exports = mongoose.model("messages", messageSchamaModel);
