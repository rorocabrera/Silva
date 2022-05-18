
const User = require('../models/user');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const Rol = require('../models/rol');

module.exports = {

    login(req, res) {
        const email = req.body.email;
        const password = req.body.password;

        User.findByEmail(email, async (err, myUser) => {
            console.log('error ', err);
            console.log('usuario ', myUser);

            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error en el log in',
                    error: err
                });
            }
            if (!myUser) {
                return res.status(401).json({
                    success: false,
                    message: 'email no registrado'
                });
            }

            const isPasswordValid = await bcrypt.compare(password, myUser.password);

            if (isPasswordValid) {
                const token = jwt.sign({ id: myUser.id, email: myUser.email }, keys.secretOrKey, {});
                const data = {
                    id: `${myUser.id}`,
                    name: myUser.name,
                    level: myUser.level,
                    email: myUser.email,
                    session_token: `JWT ${token}`,
                    roles: JSON.parse(myUser.roles)
                }

                return res.status(201).json({
                    success: true,
                    message: 'El usuario fue autenticado',
                    data: data
                });
            }

            else {
                return res.status(401).json({
                    success: false,
                    message: 'Password incorrecto'
                });
            }

        });
    },

    register(req, res) {
        console.log(' se recibe peticion post a la direccion correcta');
        console.log(req.body);
        const user = req.body; //VIENE DE FLUTTER
        User.create(user, (err, data) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro',
                    error: err
                });
            }

            user.id = `${data}`;

            Rol.create(user.id, 3, (err, data) => {
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
        })

    },
    list(res) {

        User.getAll(async (err, userList) => {
            console.log('error ', err);
            console.log('usuario ', userList);
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error en la obtención de datos',
                    error: err
                });
            }
            if (!userList) {
                return res.status(401).json({
                    success: false,
                    message: 'No hay datos para mostrar'
                });
            }


        })

    },

}