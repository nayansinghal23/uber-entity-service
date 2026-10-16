package com.example.uberentityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import lombok.*;

import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Color extends BaseModel {
    @Column(unique = true, nullable = false)
    private String name;

    @OneToMany(mappedBy = "color")
    private List<Car> car;
}
