ALTER TABLE driver
    ADD COLUMN driver_approval_status VARCHAR(255),
    ADD COLUMN last_known_location_id BIGINT,
    ADD COLUMN rating DOUBLE NOT NULL DEFAULT 0.0;

ALTER TABLE driver
    ADD CONSTRAINT fk_driver_last_known_location
        FOREIGN KEY (last_known_location_id)
            REFERENCES exact_location(id);