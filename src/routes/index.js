const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.send('Hola mundo');
});

module.exports = router;

//Para correr el aplicativo en terminar escribir el comando "npm run dev"