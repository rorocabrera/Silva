const express = require('express');

const app = express();

const http = require('http');

const server = http.createServer(app);

const logger = require('morgan');

const cors = require('cors');

const port = process.env.PORT || 5050;

const usersRoutes = require('./routes/userRoutes');

app.use(express.json());
app.use(logger('dev'));
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.disable('x-powered-by');




app.set('port', port);



usersRoutes(app);


server.listen(port, '192.168.0.111' || 'localhost', () =>
    console.log('Aplicación escuchando en puerto ' + port));


app.get('/', (req, res) => {
    res.send('ruta raiz de backend');
})

app.get('/test', (req, res) => {
    res.send('ruta test');
})


app.use((err, req, res, next) => {
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});

