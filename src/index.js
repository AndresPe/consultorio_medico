const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const { dirname } = require('path');

//inicialización de express
const app = express();

//configuraciones
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

//Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

// Variables Globales
app.use((req, res, next) =>{

    next();
});

// Routes
app.use(require('./routes/index.js'));
app.use(require('./routes/autentication'));
app.use('/', require('./routes/links'));


//Publico
app.use(express.static(path.join(__dirname, 'public'))); 

//Starting the server
app.listen(app.get('port'),() => {
    console.log('Server en puerto ', app.get('port'));
});
