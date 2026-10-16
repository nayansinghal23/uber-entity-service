package com.example.uberentityservice.models;

import com.example.uberentityservice.enums.CarType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Car extends BaseModel {
    @Column(unique = true, nullable = false)
    private String plateNumber;

    @Column(nullable = false)
    private String brand;

    @Column(nullable = false)
    private String model;

    @Enumerated(value = EnumType.STRING)
    @Column(nullable = false)
    private CarType carType;

    @OneToOne
    private Driver driver;

    @ManyToOne
    private Color color;
}
