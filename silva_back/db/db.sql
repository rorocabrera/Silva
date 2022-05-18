USE nomina

CREATE TABLE users(

	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    level INT NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP(0) NOT NULL,
    updated_at TTMESTAMP(0) NOT NULL

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



