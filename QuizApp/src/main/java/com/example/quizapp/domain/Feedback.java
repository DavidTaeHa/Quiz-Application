package com.example.quizapp.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Feedback {
    private int stars;
    private String feedback;
}
