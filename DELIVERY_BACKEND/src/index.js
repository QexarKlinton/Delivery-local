const express = require('express');
const cors = require('cors');
require('dotenv').config();
const pool = require('./db');

const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors());
app.use(express.json());

// RUTA DE PRUEBA: El Frontend o tú pueden consultar esto para ver si el backend responde
app.get('/api/test-db', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT 1 + 1 AS resultado');
        res.json({ mensaje: '¡Conexión exitosa a MySQL!', resultado: rows[0].resultado });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al conectar con la base de datos' });
    }
});

// RUTA PARA VER LOS ROLES (Ejemplo consultando la tabla de tu SQL)
app.get('/api/roles', async (req, res) => {
    try {
        const [roles] = await pool.query('SELECT * FROM roles');
        res.json(roles);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al obtener los roles' });
    }
});

app.listen(PORT, () => {
    console.log(`Servidor Backend corriendo en http://localhost:${PORT}`);
});