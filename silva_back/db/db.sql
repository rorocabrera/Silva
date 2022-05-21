CREATE DATABASE [IF NOT EXISTS] nomina

CREATE TABLE IF NOT EXISTS users(

	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL UNIQUE,
    level INT NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TTMESTAMP(0) NOT NULL

);
CREATE TABLE IF NOT EXISTS user_has_roles(
    id_user BIGINT NOT NULL,
    id_rol BIGINT NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TIMESTAMP(0) NOT NULL,
    FOREIGN KEY(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(id_user, id_rol)

);



CREATE TABLE IF NOT EXISTS roles(
    	id BIGINT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(90) NOT NULL UNIQUE,
        route VARCHAR(100) NOT NULL,
        created_at TIMESTAMP(0) NOT NULL,
        updated_at TIMESTAMP(0) NOT NULL
);


INSERT INTO IF NOT EXISTS roles(
    name,
    route,
    created_at,
    updated_at
)

VALUES (
    'ADMINISTRADOR',
    '/admin/opt',
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
    '/superv/opt',
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
    '/pers/opt',
    '2022-05-16',
    '2022-05-16'
);



