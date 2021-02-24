DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users(
    id INT(11) AUTO_INCREMENT NOT NULL,
    username VARCHAR(35) NOT NULL,
    name VARCHAR(60) NOT NULL,
    nickname VARCHAR(35),
    email VARCHAR(150) NOT NULL,
    password VARCHAR(255),
    role VARCHAR(20) NOT NULL,
    photo VARCHAR(500),
    created_at DATETIME,
    updated_at DATETIME,
    remember_token VARCHAR(255),

    CONSTRAINT pk_users PRIMARY KEY(id),
    CONSTRAINT uq_email UNIQUE(email),
    CONSTRAINT uq_username UNIQUE(username)
)ENGINE=INNODB;

INSERT INTO users VALUES(null, "tomy_olivera", "Tomas Olivera", "bokita", "tomasolivera27@gmail.com", "12345", "user", null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES(null, "juan_lopez", "Juan Lopez", "juancito", "juan@gmail.com", "12345", "user", null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES(null, "pedrito123", "Pedro Garcia", "pedrito", "pedro@gmail.com", "12345", "user", null, CURTIME(), CURTIME(), null);

DROP TABLE IF EXISTS publications;
CREATE TABLE IF NOT EXISTS publications(
    id INT(11) AUTO_INCREMENT NOT NULL,
    user_id INT(11) NOT NULL,
    description VARCHAR(130),
    photo VARCHAR(125) NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,

    CONSTRAINT pk_publications PRIMARY KEY(id),
    CONSTRAINT fk_publications_users FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

INSERT INTO publications VALUES(null, 1, "EEEEAAAAA", "", CURTIME(), CURTIME());
INSERT INTO publications VALUES(null, 1, "Vacas", "", CURTIME(), CURTIME());
INSERT INTO publications VALUES(null, 1, "Wanchopeee", "", CURTIME(), CURTIME());

INSERT INTO publications VALUES(null, 2, "En la playa", "", CURTIME(), CURTIME());
INSERT INTO publications VALUES(null, 2, "En las montañas", "", CURTIME(), CURTIME());
INSERT INTO publications VALUES(null, 2, "Con tevez", "", CURTIME(), CURTIME());

INSERT INTO publications VALUES(null, 3, "Ke personaees", "", CURTIME(), CURTIME());
INSERT INTO publications VALUES(null, 3, "", "", CURTIME(), CURTIME());
INSERT INTO publications VALUES(null, 3, "123", "", CURTIME(), CURTIME());

DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments(
    id INT(11) AUTO_INCREMENT NOT NULL,
    user_id INT(11) NOT NULL,
    publication_id INT(11) NOT NULL,
    description VARCHAR(130),
    created_at DATETIME,
    updated_at DATETIME,

    CONSTRAINT pk_comments PRIMARY KEY(id),
    CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_comments_publications FOREIGN KEY(publication_id) REFERENCES publications(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

INSERT INTO comments VALUES(null, 1, 3, "Alta foto", CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 1, 2, "Seee", CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 2, 3, "Buena fotito eaa", CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 3, 1, "Bien perrro", CURTIME(), CURTIME());

DROP TABLE IF EXISTS likes;
CREATE TABLE IF NOT EXISTS likes(
    id INT(11) AUTO_INCREMENT NOT NULL,
    user_id INT(11) NOT NULL,
    publication_id INT(11) NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,

    CONSTRAINT pk_likes PRIMARY KEY(id),
    CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_likes_publications FOREIGN KEY(publication_id) REFERENCES publications(id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

INSERT INTO likes VALUES(null, 1, 3, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 1, 2, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 2, 3, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 3, 1, CURTIME(), CURTIME());