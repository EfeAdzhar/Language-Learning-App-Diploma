//
//  BayesianTestingMethod.swift
//  LanguageDiplomApp
//
//  Created by Efe on 06.01.24.
//

import Foundation
import CoreAudio

class BayesianTestingMethodService {
    
    var priorProbabilities: [Double] = []
    var posteriorProbabilities: [Double]?
    var difficulty: Int = 0
    var lastComputedPosteriorProbabilities: [Double]?
    
    func setPriorProbabilities(_ probabilities: [Double]) {
        priorProbabilities = probabilities
    }
    
    func setDifficulty(_ value: Int) {
        difficulty = value
    }
    
    // Функція для оновлення апостеріорних ймовірностей на основі відповідей користувача
    func updateProbabilities(selectedAnswerIndex: Int, isCorrectAnswer: Bool) {
        let learningRate = 0.2 // Коефіцієнт навчання
        
        if isCorrectAnswer {
            if let posterior = posteriorProbabilities {
                for (index, _) in posterior.enumerated() {
                    if index == selectedAnswerIndex {
                        posteriorProbabilities?[index] *= (1 - learningRate)
                    } else {
                        posteriorProbabilities?[index] *= learningRate
                    }
                }
            }
        } else {
            let priorProb = priorProbabilities[selectedAnswerIndex]
            let likelihood = priorProbabilities.map { $0 / priorProb }
            
            let updatedPosteriors = updatePosteriorProbabilities(priorProbabilities: priorProbabilities, likelihoods: likelihood)
            posteriorProbabilities = updatedPosteriors
        }
        
        // Збереження останніх обчислених апостеріорних ймовірностей
        lastComputedPosteriorProbabilities = posteriorProbabilities
        formatNumbers(posteriorProbabilities: lastComputedPosteriorProbabilities ?? [])
    }
    
    // Функція для оновлення апостеріорних ймовірностей за формулою Байєса
    private func updatePosteriorProbabilities(priorProbabilities: [Double], likelihoods: [Double]) -> [Double] {
        var updatedPosteriorProbabilities = [Double]()
        let normalizationFactor = likelihoods.reduce(0, +)
        
        for (index, prior) in priorProbabilities.enumerated() {
            let likelihood = likelihoods[index]
            let posterior = (prior * likelihood) / normalizationFactor
            updatedPosteriorProbabilities.append(posterior)
        }
        return updatedPosteriorProbabilities
    }
    
    private func formatNumbers(posteriorProbabilities : [Double]) {
        for i in posteriorProbabilities.indices {
            lastComputedPosteriorProbabilities?[i] = Double(String(format: "%.2f", posteriorProbabilities[i])) ?? 0.0
        }
    }
}
