//
//  QuestionRepository.swift
//  LanguageDiplomApp
//
//  Created by Efe on 27.12.23.
//

import Foundation

class QuestionRepository {
    private var questions : QuestionEntity?
    
    init() {
        questions = QuestionEntity()
        questions = createQuestions()
    }
    
    func createQuestions() -> QuestionEntity {
        return QuestionEntity(
            questions:
                [
            Questions(correct_answer: "or",
                     option_1: "so",
                     option_2: "because",
                     option_3: "or",
                     option_4: "but",
                     question: "Does Dave drive a car, ___ does he ride a bike?"),
            Questions(correct_answer: "big friendly dog",
                      option_1: "friendly dog big",
                      option_2: "big dog friendly",
                      option_3: "dog is friendly and is big",
                      option_4: "big friendly dog",
                      question: "My neighbor has a ___.")
                ]
        )
    }
    
    func getQuestions() -> QuestionEntity {
        return self.questions!
    }
}
