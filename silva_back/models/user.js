
const db = require('../config/config');
const bcrypt = require('bcryptjs');
var CryptoJS = require("crypto-js");

const User = {};

User.findById = (id, result) => {
    const sql = `
    
    SELECT
        CONVERT(U.id, char) as id,
            U.email,
            U.name,
            U.level,
            U.updated_at,
            U.password,
            CONCAT('[', GROUP_CONCAT(json_object(
                'id', CONVERT(R.id, char), 'name', R.name, 'route', R.route )), ']') AS roles
        FROM
            users AS U
        INNER JOIN
            user_has_roles AS UHR
        ON
            UHR.id_user = U.id
        INNER JOIN
            roles AS R
        ON
            UHR.id_rol = R.id
        WHERE
            U.id = ?
        GROUP BY
            U.id

    `;

    db.query(
        sql,
        [id],
        (err, user) => {
            if (err) {
                console.log('Error: ', err)
                result(err, null);
            }
            else {

                result(null, user);

            }

        }

    );
}

User.findByEmail = (email, result) => {


    const sql = `
    SELECT
        U.id,
        U.email,
        U.name,
        U.level,
        U.updated_at,
        U.password,
        CONCAT('[', GROUP_CONCAT(json_object(
            'id', CONVERT(R.id, char), 'name', R.name, 'route', R.route )), ']') AS roles
    FROM
        users AS U
    INNER JOIN
    	user_has_roles AS UHR  
    ON
    	UHR.id_user = U.id
    INNER JOIN
    	roles AS R
    ON
    	UHR.id_rol = R.id
    WHERE
        email = ?
    GROUP BY
        U.id
    `;

    db.query(
        sql,
        [email],
        (err, user) => {
            if (err) {
                console.log('Error:', err);
                result(err, null);
            }
            else {

                result(null, user[0]);
            }
        }
    )

}

User.create = async (user, result) => {
    console.log(process.env.KEY + 'la llave');
    // const hash = await bcrypt.hash(user.password, 10);
    const hash = CryptoJS.AES.encrypt(user.password, process.env.KEY).toString();
    console.log(hash);
    const sql = `
        INSERT INTO 
            users(
                email,
                name,
                level,
                password,
                created_at,
                updated_at
            )
        VALUES(?, ?, ? , ?, ? , ?)
    
    
    `;

    db.query(

        sql,
        [
            user.email,
            user.name,
            1,
            hash,
            new Date(),
            new Date()

        ],
        (err, res) => {
            if (err) {
                console.log('Error: ', err)
                result(err, null);
            }
            else {
                console.log('Id del nuevo usuario: ', res.insertId);
                result(null, res.insertId);

            }

        }

    )
}

User.getAll = (result) => {
    const sql = `
    SELECT
        CONVERT(U.id, char) as id,
        U.email,
        U.name,
        U.level,
        
        CONCAT('[', GROUP_CONCAT(json_object(
            'id', CONVERT(R.id, char), 'name', R.name, 'route', R.route )), ']') AS roles
    FROM
        users AS U
    INNER JOIN
    	user_has_roles AS UHR  
    ON
    	UHR.id_user = U.id
    INNER JOIN
    	roles AS R
    ON
    	UHR.id_rol = R.id
    GROUP BY
        U.id, U.name;
    `;
    db.query(sql, (err, data) => {
        if (err) {
            console.log('Error: ', err)
            result(err, null);
        }
        else {

            result(null, data);

        }

    })


}

module.exports = User;
