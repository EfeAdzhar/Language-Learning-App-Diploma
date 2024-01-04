//
//  QuestionService.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

class QuestionService {
    private var repository = QuizRepostitory()
    private var counter = 0
    
    func getQuestions() -> QuestionProtocol? {
        return self.repository.getQuestions()
    }
    
    func getQuizes() -> QuizProtocol? {
        return self.repository.getQuizes()
    }
}
