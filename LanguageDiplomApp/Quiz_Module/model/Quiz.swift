//
//  Quiz.swift
//  LanguageDiplomApp
//
//  Created by Efe on 08.12.23.
//

import Foundation

struct Quiz : QuizProtocol {
    var question: String
    var answers : Answers
    var answer : String
    var questionType: QuestionType = .QUIZ
    var questionImage: String
    var priorProbabilities: [Double]
    var posteriorProbabilities: [Double]?
    var difficulty: Int
}
