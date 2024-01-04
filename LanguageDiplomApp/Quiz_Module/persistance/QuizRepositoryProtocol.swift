//
//  QuizProtocol.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

protocol QuizRepositoryProtocol {
    func getQuestions() -> QuestionProtocol?
    func getQuizes() -> QuizProtocol?
}
