const { Pool } = require("pg");

const pool = new Pool({
  host: "localhost",
  user: "postgres",
  password: "2512001",
  database: "airlines_db",
});
// console.log(pool);
module.exports = pool;