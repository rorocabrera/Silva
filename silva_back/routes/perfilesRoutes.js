const perfilesController = require('../controllers/perfilesController');
const passport = require('passport');


module.exports = (app) => {

    app.post('/api/perfiles/add', perfilesController.add);
    app.get('/api/perfiles/list', perfilesController.list);
    app.delete('/api/perfiles/del', perfilesController.delete);

}
