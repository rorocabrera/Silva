const db = require('../config/config');


const Rol = {};

Rol.create = (id_user, id_rol, result) => {
    const sql = `
    INSERT INTO 
        user_has_roles(
            id_user,
            id_rol,
            created_at,
            updated_at
        )
        VALUES (?,?,?,?)
    `;

    db.query(
        sql,
        [id_user, id_rol, new Date(), new Date()],
        (err, res) => {
            if (err) {
                console.log('Error: ', err)
                result(err, null);
            }
            else {
                console.log('Rol establecido', res.insertId);
                result(null, res.insertId);

            }

        });
}

Rol.delete = (id_user, id_rol, result) => {
    const sql = `
            DELETE FROM 
                user_has_roles 
                WHERE id_user = ?
                AND id_rol = ?

            `;

    db.query(
        sql,
        [id_user, id_rol],
        (err, res) => {
            if (err) {
                console.log('Error: ', err)
                result(err, null);
            }
            else {
                console.log('Rol eliminado', res.insertId);
                result(null, res.insertId);

            }

        });
}

Rol.changeLevel = (id_user, id_level, result) => {
    const sql = `
            UPDATE
                users 
                SET level = ?
                WHERE id = ?

            `;

    db.query(
        sql,
        [id_level, id_user],
        (err, res) => {
            if (err) {
                console.log('Error: ', err)
                result(err, null);
            }
            else {
                console.log('Se modificó el nivel del usuario', res.insertId);
                result(null, res.insertId);

            }

        });
}
Rol.modelList = (result) => {
    const sql =
        `
            SELECT
            id,
            name
            FROM roles
            `;
    db.query(sql, (err, res) => {
        if (err) {
            console.log('Error: ', err)
            result(err, null);
        }
        else {
            console.log("se realizo peticion de lista de roles");
            result(null, res);

        }

    }
    );



}


module.exports = Rol;

