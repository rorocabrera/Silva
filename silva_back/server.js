const express = require('express');

const app = express();

const http = require('http');

const server = http.createServer(app);

const logger = require('morgan');

const cors = require('cors');

const port = process.env.PORT || 5050;

//importar rutas

const usersRoutes = require('./routes/userRoutes');
const perfilesRoutes = require('./routes/perfilesRoutes');

const passport = require('passport');

app.use(express.json());
app.use(logger('dev'));
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(passport.initialize());

app.use(passport.session());
app.disable('x-powered-by');

require('./config/passport')(passport);


app.set('port', port);

//llamada a las rutas
usersRoutes(app);
perfilesRoutes(app);


server.listen(port, '192.168.0.103' || 'localhost', () =>
    console.log('Aplicación escuchando en puerto ' + port));





app.use((err, req, res, next) => {
    console.log(err);
    res.status(err.status || 500).send(err.stack);


});

app.get('/', (req, res) => {
    res.send('ruta raiz de backend');
})

module.exports = {
    app: app,
    server: server
}

