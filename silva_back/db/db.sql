USE nominaM

CREATE TABLE users(

	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TTMESTAMP(0) NOT NULL

);


CREATE TABLE roles(
    	id BIGINT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(90) NOT NULL,
        route VARCHAR(100) NOT NULL,
        created_at TIMESTAMP(0) NOT NULL,
        updated_at TIMESTAMP(0) NOT NULL
);


INSERT INTO roles(
    name,
    route,
    created_at,
    updated_at
)

VALUES (
    'ADMINISTRADOR',
    '/admin/options',
    '2022-05-16',
    '2022-05-16'
);


INSERT INTO roles(
    name,
    route,
    created_at,
    updated_at
)

VALUES (
    'SUPERVISOR',
    '/superv/options',
    '2022-05-16',
    '2022-05-16'
);

INSERT INTO roles(
    name,
    route,
    created_at,
    updated_at
)

VALUES (
    'PERSONAL',
    '/personal/options',
    '2022-05-16',
    '2022-05-16'
);


CREATE TABLE user_has_roles(
    id_user BIGINT NOT NULL,
    id_rol BIGINT NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL,
    FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(id_user, id_rol)

);



SELECT
        U.id,
        U.email,
        U.name,
        U.password,
        JSON_ARRAYAGG(
        JSON_OBJECT(
            'id', R.id,
            'name', R.name,
            'route', R.route
            
        ) ) AS roles
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
        email = 'elrodrix@gmail.com'
    GROUP BY
        U.id