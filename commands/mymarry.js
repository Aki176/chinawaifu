let rollList = require("../helpers/loadwaifu").rollList;
let Discord = require("discord.js");

exports.run = async (message, bot) => {
  // console.log(allSeries);
  let user = message.author;
  user.serverid = message.guild.id;

  let msg = "";
  let rows = await bot.dbhelper.listWaifus(user);

  rows.forEach(row => {
    let waifuSeries = row.series;

    let shouldAddExtraTag = waifuName => {
      if (rollList.duplicateWaifuList.hasOwnProperty(waifuName)) return true;
      return false;
    };
    let waifuID = `${row.name}${
      shouldAddExtraTag(row.name)
        ? ` ${waifuSeries.extraTag.toLowerCase()}`
        : ``
    }`.trim();
    console.log(waifuID);
    msg += `\n**[Lv.${row.claimedamount}]** ${row.name}`;
  });

  let emb = new Discord.RichEmbed()
    .setTitle(`${user.username}'s waifus`)
    .setDescription(msg);

  message.channel.send(emb).then();
};

exports.conf = {
  name: "My Marry",
  fullcmd: "mymarry",
  alias: "mm",
  description: "Show all your claimed waifus",
  timer: 500
};
