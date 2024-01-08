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
    private var bayesianMethodService = BayesianTestingMethodService()
    private var lastComputedPosteriorProbabilities : [String : [Double]] = [:]
    
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
    
    func getBayesianMethod() -> BayesianTestingMethodService {
        return self.bayesianMethodService
    }
    
    func setBayesianParameters(priorProbabilities: [Double], difficulty: Int) {
           bayesianMethodService.setPriorProbabilities(priorProbabilities)
           bayesianMethodService.setDifficulty(difficulty)
       }
    
    func updateProbabilities(selectedAnswerIndex: Int, isCorrectAnswer : Bool) {
        bayesianMethodService.updateProbabilities(selectedAnswerIndex: selectedAnswerIndex,
                                           isCorrectAnswer: isCorrectAnswer)
    }
    
    func addUpdatedPosteriorProbabilities(_ dto : BayesianTestingMethodDto) {
        lastComputedPosteriorProbabilities[dto.question ?? "error in addUpdatedPosteriorProbabilities"] = dto.priorProbabilities
        print(lastComputedPosteriorProbabilities)
    }
}
