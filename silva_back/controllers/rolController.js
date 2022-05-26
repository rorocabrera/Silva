
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const Rol = require('../models/rol');

module.exports = {


    addRol(req, res) {
        const userId = req.body.id;
        const rolId = req.body.rol;
        Rol.create(userId, rolId, (err, data) => {
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

    deleteRol(req, res) {
        const userId = req.body.id;
        const rolId = req.body.rol;
        Rol.delete(userId, rolId, (err, data) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error en la operación',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'El rol se actualizó correctamente',
                data: data
            });

        })

    },
    changeLevel(req, res) {
        const userId = req.body.id;
        const levelId = req.body.level;
        Rol.changeLevel(userId, levelId, (err, data) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error en la operación',
                    error: err
                });
            }

            return res.status(201).json({
                success: true,
                message: 'El nivel se actualizó correctamente',
                data: data
            });

        })

    },
    rolesModelList(req, res) {
        Rol.modelList((err, data) => {
            console.log(data);
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error en la operación',
                    error: err
                });
            }

            return res.status(201).json(
                data);

        })

    },


}