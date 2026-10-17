
-- 1. OTP
CREATE TABLE otp (
                     id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                     created_at DATETIME(6) NOT NULL,
                     updated_at DATETIME(6) NOT NULL,
                     code VARCHAR(255),
                     send_to_number VARCHAR(255)
);

-- 2. ExactLocation
CREATE TABLE exact_location (
                                id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                created_at DATETIME(6) NOT NULL,
                                updated_at DATETIME(6) NOT NULL,
                                latitude DOUBLE,
                                longitude DOUBLE
);

-- 3. NamedLocation
CREATE TABLE named_location (
                                id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                created_at DATETIME(6) NOT NULL,
                                updated_at DATETIME(6) NOT NULL,
                                exact_location_id BIGINT UNIQUE,
                                name VARCHAR(255),
                                zip_code VARCHAR(255),
                                city VARCHAR(255),
                                country VARCHAR(255),
                                state VARCHAR(255),

                                CONSTRAINT fk_named_location_exact_location
                                    FOREIGN KEY (exact_location_id)
                                        REFERENCES exact_location(id)
);
