//
//  QuestionModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 27.12.23.
//

import Foundation

struct QuestionEntity: Codable {
    var questions: [Questions]?
}
    
struct Questions: Codable {
    var correct_answer: String?
    var option_1: String?
    var option_2: String?
    var option_3: String?
    var option_4: String?
    var question: String?
    var priorProbabilities: [Double]?
    var posteriorProbabilities: [Double]?
    var difficulty: Int?
}
