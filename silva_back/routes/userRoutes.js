const usersController = require('../controllers/usersController');
const rolController = require('../controllers/rolController');
const passport = require('passport');


module.exports = (app) => {

    app.post('/api/users/create', usersController.register);
    app.post('/api/users/login', usersController.login);
    app.post('/api/users/changeLevel', rolController.changeLevel);
    app.delete('/api/users/deleteRol', rolController.deleteRol);
    app.post('/api/users/addRol', rolController.addRol);
    app.get('/api/users/list', usersController.list);
    app.get('/api/users/:id', usersController.getUser);
    app.get('/api/roles/list', rolController.rolesModelList);


}
