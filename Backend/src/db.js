const mysql = require('mysql2/promise');
require('dotenv').config();

const requiredVariables = ['DB_HOST', 'DB_USER', 'DB_NAME'];
const missingVariables = requiredVariables.filter(
  (variable) => !process.env[variable]
);

if (missingVariables.length > 0) {
  throw new Error(
    `Faltan variables de entorno obligatorias: ${missingVariables.join(', ')}. Revisa DELIVERY_BACKEND/.env.`
  );
}

const dbPort = Number(process.env.DB_PORT || 3306);

if (!Number.isInteger(dbPort) || dbPort < 1 || dbPort > 65535) {
  throw new Error('DB_PORT debe ser un número de puerto válido.');
}

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME,
  port: dbPort,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  enableKeepAlive: true
});

module.exports = pool;
