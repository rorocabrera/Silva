const perfilesController = require('../controllers/perfilesController');
const passport = require('passport');


module.exports = (app) => {

    app.post('/api/perfiles/add', perfilesController.add);

}
