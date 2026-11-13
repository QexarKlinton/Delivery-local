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

// Lista negocios activos e incluye los datos de su responsable.
app.get('/api/negocios', async (req, res, next) => {
  try {
    const [negocios] = await pool.query(
      `SELECT
         n.id_negocio,
         n.nombre,
         n.descripcion,
         n.categoria,
         n.direccion,
         n.telefono,
         n.horario_atencion,
         n.observaciones,
         n.logo_url,
         v.id_vendedor,
         v.nombre AS responsable,
         v.correo AS correo_contacto
       FROM negocios n
       LEFT JOIN vendedores v ON v.id_vendedor = n.id_vendedor
       WHERE n.activo = TRUE
       ORDER BY n.nombre`
    );

    res.json(negocios);
  } catch (error) {
    next(error);
  }
});

// Lista los 21 puntos institucionales de entrega de CUTlaquepaque.
app.get('/api/puntos-entrega', async (req, res, next) => {
  try {
    const [puntos] = await pool.query(
      `SELECT id_punto_entrega, nombre, tipo, edificio, referencia, descripcion
       FROM puntos_entrega
       WHERE activo = TRUE
       ORDER BY orden`
    );
    res.json(puntos);
  } catch (error) {
    next(error);
  }
});

// Lista productos disponibles, con su categoría y datos del catálogo.
app.get('/api/productos', async (req, res, next) => {
  try {
    const { id_negocio: idNegocio } = req.query;

    let sql = `SELECT
                 p.id_producto,
                 p.id_negocio,
                 n.nombre AS nombre_negocio,
                 p.id_categoria,
                 c.nombre AS categoria,
                 p.nombre,
                 p.descripcion,
                 p.precio,
                 p.disponible,
                 p.disponibilidad_texto,
                 p.existencias_aproximadas,
                 p.existencias_texto,
                 p.tiempo_preparacion_texto
               FROM productos p
               INNER JOIN negocios n ON n.id_negocio = p.id_negocio
               LEFT JOIN categorias c ON c.id_categoria = p.id_categoria
               WHERE p.disponible = TRUE AND n.activo = TRUE`;
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

    sql += ' ORDER BY n.nombre, p.nombre, p.id_producto';

    const [productos] = await pool.query(sql, params);
    res.json(productos);
  } catch (error) {
    next(error);
  }
});

// Lista las variantes estructuradas de un producto.
app.get('/api/productos/:idProducto/variantes', async (req, res, next) => {
  try {
    const idProducto = Number(req.params.idProducto);

    if (!Number.isInteger(idProducto) || idProducto <= 0) {
      return res.status(400).json({
        error: 'id_producto debe ser un entero positivo.'
      });
    }

    const [variantes] = await pool.query(
      `SELECT id_variante, id_producto, nombre, precio
       FROM producto_variantes
       WHERE id_producto = ? AND disponible = TRUE
       ORDER BY id_variante`,
      [idProducto]
    );

    res.json(variantes);
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
