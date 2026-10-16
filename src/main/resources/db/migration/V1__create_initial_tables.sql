
-- 1. Passenger
CREATE TABLE passenger (
                           id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                           created_at DATETIME(6) NOT NULL,
                           updated_at DATETIME(6) NOT NULL,
                           name VARCHAR(255) NOT NULL,
                           phone_number VARCHAR(255) NOT NULL,
                           email VARCHAR(255) NOT NULL,
                           password VARCHAR(255) NOT NULL
);

-- 2. Driver
CREATE TABLE driver (
                        id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        created_at DATETIME(6) NOT NULL,
                        updated_at DATETIME(6) NOT NULL,
                        name VARCHAR(255) NOT NULL,
                        license_number VARCHAR(255) NOT NULL UNIQUE
);

-- 3. Color
CREATE TABLE color (
                       id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       created_at DATETIME(6) NOT NULL,
                       updated_at DATETIME(6) NOT NULL,
                       name VARCHAR(255) NOT NULL UNIQUE
);

-- 4. Car
CREATE TABLE car (
                     id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                     created_at DATETIME(6) NOT NULL,
                     updated_at DATETIME(6) NOT NULL,
                     plate_number VARCHAR(255) NOT NULL UNIQUE,
                     brand VARCHAR(255) NOT NULL,
                     model VARCHAR(255) NOT NULL,
                     car_type VARCHAR(255) NOT NULL,
                     driver_id BIGINT UNIQUE,
                     color_id BIGINT,

                     CONSTRAINT fk_car_driver
                         FOREIGN KEY (driver_id) REFERENCES driver(id),

                     CONSTRAINT fk_car_color
                         FOREIGN KEY (color_id) REFERENCES color(id)
);

-- 5. Booking
CREATE TABLE booking (
                         id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         created_at DATETIME(6) NOT NULL,
                         updated_at DATETIME(6) NOT NULL,
                         booking_status VARCHAR(255),
                         start_time DATETIME(6),
                         end_time DATETIME(6),
                         total_distance BIGINT NOT NULL,
                         driver_id BIGINT,
                         passenger_id BIGINT,

                         CONSTRAINT fk_booking_driver
                             FOREIGN KEY (driver_id) REFERENCES driver(id),

                         CONSTRAINT fk_booking_passenger
                             FOREIGN KEY (passenger_id) REFERENCES passenger(id)
);

-- 6. Review (parent entity)
CREATE TABLE booking_review (
                                id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                created_at DATETIME(6) NOT NULL,
                                updated_at DATETIME(6) NOT NULL,
                                content VARCHAR(255) NOT NULL,
                                rating DOUBLE,
                                booking_id BIGINT NOT NULL UNIQUE,

                                CONSTRAINT fk_review_booking
                                    FOREIGN KEY (booking_id) REFERENCES booking(id)
);

-- 7. PassengerReview (JOINED inheritance)
CREATE TABLE passenger_review (
                                  id BIGINT NOT NULL PRIMARY KEY,
                                  passenger_review_comment VARCHAR(255),
                                  passenger_rating DOUBLE NOT NULL,

                                  CONSTRAINT fk_passenger_review_review
                                      FOREIGN KEY (id) REFERENCES booking_review(id)
);
