//
//  QuestionProtocol.swift
//  LanguageDiplomApp
//
//  Created by Efe on 08.12.23.
//

import Foundation

protocol QuestionProtocol {
    var question : String {get}
    var answers : Answers {get}
    var questionType : QuestionType {get}
    var questionImage : String {get}
}

protocol QuizProtocol : QuestionProtocol {
    var answer : String {get}
    var priorProbabilities: [Double] {get set}
    var posteriorProbabilities: [Double]? {get}
    var difficulty: Int { get }
}
