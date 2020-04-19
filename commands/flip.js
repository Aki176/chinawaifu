exports.run = (message, bot) => {
  let side = message.args.toLowerCase() || "front";
  let sides = ["front", "back"];
  if (sides.indexOf(side) == -1)
    return message.channel.send("Invalid side. Try front or back.");
  // Flip the side
  var actual_side = sides[Math.floor(Math.random() * sides.length)];
  if (side == actual_side) {
    bot.dbhelper.changeMoney(user, 50);
    message.channel.send("You won $50!");
  } else {
    bot.dbhelper.changeMoney(user, -50);
    message.channel.send("You lost $50!");
  }
};

exports.conf = {
  name: "Flip Card",
  fullcmd: "flip",
  alias: "f",
  description: "Flip a card.",
  timer: 500,
  tokenCost: 0
};
