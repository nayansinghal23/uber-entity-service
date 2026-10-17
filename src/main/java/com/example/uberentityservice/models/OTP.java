package com.example.uberentityservice.models;

import jakarta.persistence.Entity;
import lombok.*;

import java.util.Random;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OTP extends BaseModel {
    private String code;

    private String sendToNumber;

    public static OTP make(String phoneNumber) {
        Random random = new Random();
        int code = random.nextInt(9000) + 1000;
        return OTP
                .builder()
                .sendToNumber(phoneNumber)
                .code(Integer.toString(code))
                .build();
    }
}
