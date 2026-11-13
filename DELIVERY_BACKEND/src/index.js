const express = require('express');
const cors = require('cors');
require('dotenv').config();

const pool = require('./db');

const app = express();
const PORT = Number(process.env.PORT || 4000);

if (!Number.isInteger(PORT) || PORT < 1 || PORT > 65535) {
  throw new Error('PORT debe ser un número de puerto válido.');
}

const allowedOrigins = process.env.CORS_ORIGIN
  ? process.env.CORS_ORIGIN.split(',').map((origin) => origin.trim())
  : true;

app.use(cors({ origin: allowedOrigins }));
app.use(express.json({ limit: '1mb' }));

// Verifica que la API responde y muestra la base de datos utilizada.
app.get('/api/test-db', async (req, res, next) => {
  try {
    const [rows] = await pool.query(
      'SELECT DATABASE() AS base_datos, 1 + 1 AS resultado'
    );

    res.json({
      mensaje: 'Conexión exitosa a MySQL.',
      base_datos: rows[0].base_datos,
      resultado: rows[0].resultado
    });
  } catch (error) {
    next(error);
  }
});

// Obtiene los valores permitidos del ENUM rol de la tabla usuarios.
app.get('/api/roles', async (req, res, next) => {
  try {
    const [rows] = await pool.query(
      `SELECT COLUMN_TYPE
       FROM INFORMATION_SCHEMA.COLUMNS
       WHERE TABLE_SCHEMA = DATABASE()
         AND TABLE_NAME = 'usuarios'
         AND COLUMN_NAME = 'rol'`
    );

    if (rows.length === 0) {
      return res.status(500).json({
        error: 'No se encontró la columna usuarios.rol en la base de datos configurada.'
      });
    }

    const roles = [...rows[0].COLUMN_TYPE.matchAll(/'((?:[^'\\]|\\.)*)'/g)]
      .map((match) => match[1]);

    res.json(roles);
  } catch (error) {
    next(error);
  }
});

// Lista los negocios activos.
app.get('/api/negocios', async (req, res, next) => {
  try {
    const [negocios] = await pool.query(
      `SELECT id_negocio, nombre, descripcion, categoria, direccion, telefono
       FROM negocios
       WHERE activo = TRUE
       ORDER BY nombre`
    );

    res.json(negocios);
  } catch (error) {
    next(error);
  }
});

// Lista productos disponibles. Puede filtrarse por id_negocio.
app.get('/api/productos', async (req, res, next) => {
  try {
    const { id_negocio: idNegocio } = req.query;

    let sql = `SELECT
                  p.id_producto,
                  p.id_negocio,
                  n.nombre AS nombre_negocio,
                  p.nombre,
                  p.descripcion,
                  p.precio,
                  p.disponible
                FROM productos p
                INNER JOIN negocios n
                  ON n.id_negocio = p.id_negocio
                WHERE p.disponible = TRUE
                  AND n.activo = TRUE`;
    const params = [];

    if (idNegocio !== undefined) {
      const parsedId = Number(idNegocio);

      if (!Number.isInteger(parsedId) || parsedId <= 0) {
        return res.status(400).json({
          error: 'id_negocio debe ser un entero positivo.'
        });
      }

      sql += ' AND p.id_negocio = ?';
      params.push(parsedId);
    }

    sql += ' ORDER BY n.nombre, p.nombre';

    const [productos] = await pool.query(sql, params);
    res.json(productos);
  } catch (error) {
    next(error);
  }
});

// Respuesta para rutas inexistentes.
app.use((req, res) => {
  res.status(404).json({ error: 'Ruta no encontrada.' });
});

// Manejo centralizado de errores.
app.use((error, req, res, next) => {
  console.error(error);

  if (res.headersSent) {
    return next(error);
  }

  res.status(500).json({
    error: 'Ocurrió un error interno en el servidor.'
  });
});

app.listen(PORT, () => {
  console.log(`Backend disponible en http://localhost:${PORT}`);
});
