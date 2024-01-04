//
//  Quiz.swift
//  LanguageDiplomApp
//
//  Created by Efe on 07.12.23.
//

import Foundation


struct Question : QuestionProtocol {
    var question : String
    var answers: Answers
    var questionType : QuestionType = .QUESTION
    var questionImage: String
}

struct Answers {
    var answers : [String]
}

enum QuestionType {
    case QUIZ
    case QUESTION
}
