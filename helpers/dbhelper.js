module.exports = bot => {
  out = {};
  out.getWaifu = waifuName => {
    bot.db.query(
      'SELECT * FROM waifu WHERE "name"=$1;',
      [waifuName],
      (err, res) => {
        if (err) {
          throw err;
        }
        let row = res.rows[0];
        return {
          name: row.name,
          img: JSON.parse(row.img),
          series: row.series
        };
      }
    );
  };

  out.listWaifus = async user => {
    let res = await bot.db.query(
      'SELECT * FROM claimedList l JOIN waifu w ON (l."waifu"=w."name") WHERE "userid"=$1;',
      [user.id]
    );
    return res.rows;
  };

  out.changeMoney = async (user, amount) => {
    // There is a serious design flaw here that will make money be negative, I cannot fix that
    // in this time period
    bot.db.connect((err, client, release) => {
      if (err) throw err;
      client.query(
        'SELECT * FROM profile WHERE "userid"=$1;',
        [user.id],
        (err, res) => {
          if (err) throw err;
          if (!res.rows[0])
            client.query('INSERT INTO profile ("userid") VALUES ($1);', [
              user.id
            ]);
          client.query(
            'UPDATE profile SET "money"="money"+$1 WHERE "user"=$2;',
            [amount, user.id]
          );
        }
      );
    });
  };

  out.claimWaifu = (user, waifu) => {
    bot.db.connect((err, client, release) => {
      if (err) throw err;
      client.query(
        'SELECT * FROM claimedList WHERE "waifu"=$1 AND "userid"=$2;',
        [waifu.name, user.id],
        (err, res) => {
          if (err) {
            throw err;
          }

          if (res.rows[0] === undefined) {
            client.query(
              'SELECT * FROM profile WHERE "userid"=$1;',
              [user.id],
              (err, res) => {
                if (err) throw err;
                if (!res.rows[0]) {
                  client.query('INSERT INTO profile ("userid") VALUES ($1);', [
                    user.id
                  ]);
                }
                client.query(
                  'INSERT into claimedList("userid", "waifu") VALUES ($1, $2);',
                  [user.id, waifu.name]
                );
              }
            );
          } else {
            client.query(
              'UPDATE claimedList SET "claimedamount"="claimedamount"+1 WHERE "waifu"=$1 AND "userid"=$2 AND "serverid"=$3;',
              [waifu.name, user.id, user.serverid]
            );
          }
        }
      );
    });
  };
  return out;
};
