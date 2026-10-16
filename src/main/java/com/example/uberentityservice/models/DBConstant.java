package com.example.uberentityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class DBConstant extends BaseModel {
    @Column(unique = true, nullable = false)
    private String name;

    private String value;
}
