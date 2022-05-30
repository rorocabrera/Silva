
const Perfil = require('../models/perfil');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const perfilesRoutes = require('../routes/perfilesRoutes');


module.exports = {

    delete(req, res) {
        console.log(' se recibe peticion eliminar perfil');
        console.log(req.body.cedula);
        Perfil.delete(req.body.cedula, (err, data) => {

            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con la peticion',
                    error: err
                });
            }


            return res.status(201).json({
                success: true,
                message: 'Perfil eliminado correctamente',
                data: data
            });
        })

    },



    add(req, res) {
        console.log(' se recibe peticion registro perfil');
        console.log(req.body);
        const perfil = req.body;
        if (perfil.email === '') {
            perfil.email = null;
        }
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
    list(req, res) {

        Perfil.getAll((err, perfilList) => {
            jsonResult = JSON.parse(JSON.stringify(perfilList));

            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error en la obtención de datos',
                    error: err
                });
            }
            if (!perfilList) {
                return res.status(401).json({
                    success: false,
                    message: 'No hay datos para mostrar'
                });
            }
            return res.status(201).json(jsonResult);


        })

    },




}