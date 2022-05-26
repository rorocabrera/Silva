
const Perfil = require('../models/perfil');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');


module.exports = {



    add(req, res) {
        console.log(' se recibe peticion registro perfil');
        console.log(req.body);
        const perfil = req.body; //VIENE DE FLUTTER
        Perfil.create(perfil, (err, data) => {
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

    },




}