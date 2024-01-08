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
    
    func getRepository() -> ResultsRepository {
        return self.repository
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
    
    func getBayesianTestingMethodService() -> BayesianTestingMethodService {
        return repository.getBayesianMethod()
    }
    
    func setBayesianParameters(priorProbabilities: [Double], difficulty: Int) {
        repository.setBayesianParameters(priorProbabilities: priorProbabilities, difficulty: difficulty)
    }
    
    func updateProbabilities(selectedAnswerIndex: Int, isCorrectAnswer : Bool) {
        repository.updateProbabilities(selectedAnswerIndex: selectedAnswerIndex, isCorrectAnswer: isCorrectAnswer)
    }
    
    func addUpdatedPosteriorProbabilities(_ dto : BayesianTestingMethodDto) {
        repository.addUpdatedPosteriorProbabilities(dto)
    }
}
