
const User = require('../models/user');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const Rol = require('../models/rol');

var CryptoJS = require("crypto-js");

module.exports = {

    getUser(req, res) {
        console.log(req.params.id);



        User.findById(req.params.id, async (err, myUser) => {
            console.log('usuario ', myUser);
            jsonResult = JSON.parse(JSON.stringify(myUser[0]));
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error en la obtención de datos',
                    error: err
                });
            }
            if (!myUser) {
                return res.status(401).json({
                    success: false,
                    message: 'No hay datos para mostrar'
                });
            }
            return res.status(201).json(jsonResult);

        })
    },

    login(req, res) {
        const email = req.body.email;
        const password = req.body.password;

        User.findByEmail(email, async (err, myUser) => {
            console.log('error ', err);


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

            // const isPasswordValid = await bcrypt.compare(password, myUser.password);
            hash = CryptoJS.AES.decrypt(myUser.password, process.env.KEY).toString(CryptoJS.enc.Utf8);
            console.log(hash);
            console.log(password);
            const isPasswordValid = hash == password;
            if (isPasswordValid) {
                const token = jwt.sign({ id: myUser.id, email: myUser.email }, keys.secretOrKey, {});
                const data = {
                    id: `${myUser.id}`,
                    name: myUser.name,
                    level: myUser.level,
                    email: myUser.email,
                    updated_at: myUser.updated_at,
                    session_token: `JWT ${token}`,
                    password: myUser.password,
                    roles: JSON.parse(myUser.roles)
                }
                console.log(data);

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


    list(req, res) {

        User.getAll((err, userList) => {
            jsonResult = JSON.parse(JSON.stringify(userList));
            console.log('error en UsersController/list(res) ', err);
            console.log('UserList en UsersController/list(res): ', jsonResult);
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
            return res.status(201).json(jsonResult);


        })

    },

}