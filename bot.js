"use strict";

const config = require("./config");

const Discord = require("discord.js");
const { Pool } = require("pg");
const bot = new Discord.Client();

bot.db = new Pool({
  user: config.dbUser,
  host: config.dbHost,
  database: config.dbName,
  password: config.dbPassword,
  port: config.dbPort
});

module.exports = bot;

require("./events/onMessage");
require("./events/onError");
require("./helpers/loadcommands").load();
bot.dbhelper = require("./helpers/dbhelper")(bot);
bot.login(config.botToken);

bot.conf = {
  prefix: ";",
  claimTimeout: "15"
};
