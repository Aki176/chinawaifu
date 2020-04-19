let waifulist = require("../helpers/loadwaifu").rollList;
let embedgen = require("../helpers/claimWaifuEmbedGenerator")
  .createAndSendClaimEmbed;

exports.run = async (message, bot) => {
  let rand = Math.floor(Math.random() * 4);
  console.log(rand);
  switch (rand) {
    case 0:
      embedgen(waifulist.animeWaifu, message, bot);
      break;
    case 1:
      embedgen(waifulist.mangaWaifu, message, bot);
      break;
    case 2:
      embedgen(waifulist.vnGameWaifu, message, bot);
      break;
    case 3:
      embedgen(waifulist.kpopWaifu, message, bot);
      break;
  }
};

exports.conf = {
  name: "FreeRoll Waifu",
  fullcmd: "freeroll",
  alias: "fr",
  description: "Roll a waifu from all available lists.",
  timer: 300,
  tokenCost: 0
};
