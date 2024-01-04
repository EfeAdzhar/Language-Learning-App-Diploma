//
//  QuizRepostiroy.swift
//  LanguageDiplomApp
//
//  Created by Efe on 08.12.23.
//

import Foundation

class QuizRepostitory : QuizRepositoryProtocol {
    
    
    private lazy var quizDao = QuizDao()
    
    
    func getQuestions() -> QuestionProtocol? {
        if(quizDao.questionDbStorage() > 0) {
            return quizDao.getQuestion()
        } else {
            return Optional.none
        }
    }
    
    func getQuizes() -> QuizProtocol? {
        if(quizDao.quizDbStorage() > 0) {
            return quizDao.getQuiz()
        } else {
            return Optional.none
        }
    }
}
