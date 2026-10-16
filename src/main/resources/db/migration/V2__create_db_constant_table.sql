CREATE TABLE dbconstant (
                            id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            created_at DATETIME(6) NOT NULL,
                            updated_at DATETIME(6) NOT NULL,
                            name VARCHAR(255) NOT NULL UNIQUE,
                            value VARCHAR(255)
);