package com.example.uberentityservice.models;


import com.example.uberentityservice.enums.BookingStatus;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Booking extends BaseModel {
    @Enumerated(value = EnumType.STRING)
    private BookingStatus bookingStatus;

    private Date startTime;

    private Date endTime;

    private long totalDistance;

    @ManyToOne // Many bookings can have same driver
    private Driver driver;

    @ManyToOne // Many bookings can have same passenger
    private Passenger passenger;
}