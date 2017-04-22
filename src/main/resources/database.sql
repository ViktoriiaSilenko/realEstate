
create database real_estate_db;
use real_estate_db;

-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(100),
  password VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
ENGINE = InnoDB;

-- Table: addresses
CREATE TABLE addresses (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(2) NOT NULL,
  zip VARCHAR(10) NOT NULL
)
  ENGINE = InnoDB;

-- Table: real_estates
CREATE TABLE real_estates (
   id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   area DOUBLE NOT NULL,
  dateIn DATE NOT NULL,
  initPrice DECIMAL(10,2) NOT NULL,
  nrooms TINYINT(4) NOT NULL,
  type VARCHAR(100) NOT NULL,
  userDesc LONGTEXT NOT NULL,
  id_addr INT(11) NOT NULL,
  owner_id INT(11) NULL DEFAULT NULL,

  FOREIGN KEY (id_addr) REFERENCES addresses (id),
  FOREIGN KEY (owner_id) REFERENCES users (id)
)
  ENGINE = InnoDB;



-- Insert data

INSERT INTO users VALUES (1, 'proselyte', 'victory.silenko@gmail.com', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);

