//
//  ResultsService.swift
//  LanguageDiplomApp
//
//  Created by Efe on 22.12.23.
//

import Foundation

class ResultsService {
    private var repository = ResultsRepository()
    
    func getAnswers() -> [String] {
        return self.repository.getAnswers()
    }
    
    static func increaseCounter() {
        ResultsRepository.getNextQuestion()
    }
    
    func getRightAnswersResult() -> Int {
        return self.repository.getAmountOfRightAnswer()
    }
    
    func addQuestionAnswer(_ answer : String) {
        self.repository.addQuestionAnswer(answer)
    }
    
    func addRightQuizAnswer() {
        repository.rightAnswerCounter()
    }
}
