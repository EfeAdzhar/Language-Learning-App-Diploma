//
//  ResultsRepository.swift
//  LanguageDiplomApp
//
//  Created by Efe on 22.12.23.
//

import Foundation

class ResultsRepository {
    private var questionResults : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"] //represents the data that will be inputed
    private static var COUNTER = -1
    private var rightAnswerCount = 0

    
    func getAnswers() -> [String] {
        return self.questionResults
    }
    
    func addQuestionAnswer(_ answer : String) {
        self.questionResults[ResultsRepository.COUNTER] = answer
    }
    
     func getAmountOfRightAnswer() -> Int {
        return self.rightAnswerCount
    }
    
    static func getNextQuestion() {
        self.COUNTER+=1
    }
    
     func rightAnswerCounter() {
        self.rightAnswerCount+=1
    }
}
