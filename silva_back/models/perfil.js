const db = require('../config/config');


const Perfil = {};

Perfil.create = async (perfil, result) => {


    const sql = `
        INSERT INTO 
            perfiles(
                cedula,
                email,
                nombre,
                apellido,
                telefono,
                created_at,
                updated_at
            )
        VALUES(?, ?, ?, ?, ? , ?, ? )
    
    
    `;

    db.query(

        sql,
        [
            perfil.cedula,
            perfil.email,
            perfil.nombre,
            perfil.apellido,
            perfil.telefono,
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



module.exports = Perfil;
