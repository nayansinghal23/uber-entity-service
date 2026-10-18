-- 1. Booking: add start and end locations
ALTER TABLE booking
    ADD COLUMN start_location_id BIGINT,
    ADD COLUMN end_location_id BIGINT;

ALTER TABLE booking
    ADD CONSTRAINT fk_booking_start_location
        FOREIGN KEY (start_location_id) REFERENCES exact_location(id),
    ADD CONSTRAINT fk_booking_end_location
        FOREIGN KEY (end_location_id) REFERENCES exact_location(id);

-- Add index on booking.driver_id
-- Skip this if an equivalent index already exists.
CREATE INDEX idx_booking_driver_id ON booking(driver_id);


-- 2. Driver: add availability
ALTER TABLE driver
    ADD COLUMN is_available BIT(1) NOT NULL DEFAULT b'0';


-- 3. Passenger: add active booking, rating, and locations
ALTER TABLE passenger
    ADD COLUMN active_booking_id BIGINT UNIQUE,
    ADD COLUMN rating DOUBLE NULL,
    ADD COLUMN last_known_location_id BIGINT,
    ADD COLUMN home_id BIGINT;

ALTER TABLE passenger
    ADD CONSTRAINT fk_passenger_active_booking
        FOREIGN KEY (active_booking_id) REFERENCES booking(id),
    ADD CONSTRAINT fk_passenger_last_known_location
        FOREIGN KEY (last_known_location_id) REFERENCES exact_location(id),
    ADD CONSTRAINT fk_passenger_home
        FOREIGN KEY (home_id) REFERENCES exact_location(id);
