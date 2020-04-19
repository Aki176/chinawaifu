let Discord = require("discord.js");

exports.createAndSendClaimEmbed = (rollList, message, bot) => {
  createSFWClaimEmbed(rollList, message, bot);
};

let createClaimEmbed = (waifu, messageAuthor) => {
  return new Discord.RichEmbed()
    .setTitle(`${waifu.name}`)
    .setColor(0x00ae86)
    .setDescription(`${waifu.series}\n\nRolled by: ${messageAuthor}`)
    .setImage(`${waifu.img[0]}`)
    .setFooter(`${nsfwEmbed(waifu)}`);
};

let createSFWClaimEmbed = (rollList, message, bot) => {
  let rollType = rollList;
  let keys = Object.keys(rollType);
  let series = keys[(keys.length * Math.random()) << 0];
  let seriesWaifus = rollType[series].datalist;
  let waifu =
    seriesWaifus[
      Object.keys(seriesWaifus)[
        Math.floor(Math.random() * Object.keys(seriesWaifus).length)
      ]
    ];

  let embed = createClaimEmbed(waifu, message.author.username);

  message.channel.send(embed).then(
    // Create the reactionCollector
    msg => {
      //message.react(message.guild.emojis.get('492394595393732618'));
      msg.react("💖");
      //message.react('💓');
      let filter = (reaction, user) =>
        reaction.emoji.name === "💖" && user.id !== bot.user.id;
      let collector = msg.createReactionCollector(filter, { time: 15000 });
      collector.on("collect", r => {
        collector.stop();
        msg.clearReactions().then();
      });
      collector.on("end", collected => {
        if (collected.get("💖")) {
          let userID = collected.get("💖").users.lastKey();
          let claimingUser = collected.get("💖").users.get(userID);
          msg.channel.send(
            "<@" + userID + ">" + " has claimed " + waifu.name + "!"
          );
          let claimedEmbed = new Discord.RichEmbed()
            .setTitle(`${waifu.name}`)
            .setColor(0xe06666)
            .setDescription(
              `${waifu.series}\n\nRolled by: ${claimingUser.username}`
            )
            .setImage(`${waifu.img[0]}`)
            .setFooter(
              `Claimed by ${claimingUser.username}`,
              claimingUser.avatarURL
            );

          claimingUser.serverid = message.guild.id;
          bot.dbhelper.claimWaifu(claimingUser, waifu);
          msg.edit(claimedEmbed);
        }
        msg.clearReactions().then();
      });
    }
  );
};

let checkIfCharacterHasNSFW = character => {
  let nsfwlist = require("../helpers/loadwaifu").nsfwList;
  if (nsfwlist.hasOwnProperty(character.series.toLowerCase())) {
    if (
      nsfwlist[character.series.toLowerCase()].hasOwnProperty(
        character.name.toLowerCase()
      )
    ) {
      return nsfwlist[character.series.toLowerCase()][
        character.name.toLowerCase()
      ]["tag"];
    }
  }
  return false;
};

let nsfwEmbed = waifu => {
  let nsfwList = require("../helpers/loadwaifu").nsfwList;
  if (nsfwList.hasOwnProperty(waifu.series.toLowerCase())) {
    if (
      nsfwList[waifu.series.toLowerCase()].hasOwnProperty(
        waifu.name.toLowerCase()
      )
    ) {
      return "😳️ possible";
    }
  }
  return "";
};

async function fetchNSFWImage(tag) {
  if (tag === null || tag === undefined || tag.length < 0 || tag === false) {
    return;
  }

  let Booru = require("booru");

  let danbooru = Booru("db");

  let res = await danbooru.search([tag, "-rating:s"], { limit: 25 });
  return {
    src: "Danbooru",
    img: res[Math.floor(Math.random() * res.length)]._data.file_url
  };
}
