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
        var questionsArray =  QuestionEntity(
            questions:
                [
            Questions(correct_answer: "or",
                     option_1: "so",
                     option_2: "because",
                     option_3: "or",
                     option_4: "but",
                     question: "Does Dave drive a car, ___ does he ride a bike?",
                      priorProbabilities: [25.0, 25.0, 25.0, 25.0],
                     difficulty: 1),
            Questions(correct_answer: "big friendly dog",
                      option_1: "friendly dog big",
                      option_2: "big dog friendly",
                      option_3: "dog is friendly and is big",
                      option_4: "big friendly dog",
                      question: "My neighbor has a ___.",
                      priorProbabilities: [25.0, 25.0, 25.0, 25.0],
                      difficulty: 1),
            Questions(correct_answer: "made",
                      option_1: "made",
                      option_2: "done",
                      option_3: "did",
                      option_4: "do",
                      question: "We haven't ___ any plans for this weekend.",
                      priorProbabilities: [25.0, 25.0, 25.0, 25.0],
                      difficulty: 2),
            Questions(correct_answer: "for breakfast",
                      option_1: "for have breakfast",
                      option_2: "for having breakfast",
                      option_3: "for breakfast",
                      option_4: "for has breakfast",
                      question: "Do you want to go to the bar ___?",
                      priorProbabilities: [25.0, 25.0, 25.0, 25.0],
                      difficulty: 2),
            Questions(correct_answer: "any longer",
                      option_1: "any longer",
                      option_2: "no longer",
                      option_3: "any more",
                      option_4: "no more",
                      question: "We aren't friends ___.",
                      priorProbabilities: [25.0, 25.0, 25.0, 25.0],
                      difficulty: 3),
            Questions(correct_answer: "'m traveling",
                      option_1: "go on a travel",
                      option_2: "travel",
                      option_3: "going to travel",
                      option_4: "'m traveling",
                      question: "I ___ to Las Vegas with all my friends next weekend!",
                      priorProbabilities: [25.0, 25.0, 25.0, 25.0],
                      difficulty: 3),
                ]
        )
        var questions = questionsArray.questions
        
        for i in questions!.indices {
            questions![i].priorProbabilities = GenerateProbabilitiesService.generateQuestionsProbabilities(for: questions![i])
        }
        questionsArray.questions = questions
        return questionsArray
    }
    
    func getQuestions() -> QuestionEntity {
        return self.questions!
    }
}
