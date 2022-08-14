package com.example.quizapp.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Answer {
    Question question;
    String answerInput;
    String correct;
}
