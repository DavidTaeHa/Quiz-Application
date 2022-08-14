package com.example.quizapp.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Question {
    private String topic;
    private String description;
    private String mc1;
    private String mc2;
    private String mc3;
    private String mc4;
    private String answer;
}
