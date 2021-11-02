const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/add', (req, res) =>{
    res.render('links/add');
});

router.post('/add', async (req, res) =>{
    const { id, username, password } = req.body;
    const newLink = {
        id,
        username,
        password
    };
    await pool.query('INSERT INTO afiliado set ?', [newLink]);
    //req.flash('success', 'Link Saved Successfully');
    res.send('received');
})

router.get('/admin', async (req, res) => {
    const citas = await pool.query('SELECT * FROM citas');
    console.log(citas);
    res.render('links/list.hbs', { citas });
});

module.exports = router; 