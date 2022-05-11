const User = require('../models/user');

module.exports = {

    register(req, res) {

        const user = req.body; //VIENE DE FLUTTER
        User.create(user, (err, data) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'el registro se realizó correctamente',
                data: data
            });


        })

    }

}