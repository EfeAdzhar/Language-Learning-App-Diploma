//
//  GenerateProbabilitiesService.swift
//  LanguageDiplomApp
//
//  Created by Efe on 07.01.24.
//

import Foundation

class GenerateProbabilitiesService {
    static func generateQuizzesProbabilities(for quiz: Quiz) -> [Double] {
        var probabilities = [Double]()
        
        switch quiz.difficulty {
          case 1:
              probabilities = [40.0, 30.0, 20.0, 10.0] // Низька складність, більше ймовірності для перших відповідей
          case 2:
              probabilities = [30.0, 40.0, 20.0, 10.0] // Низька до середня складність
          case 3:
              probabilities = [20.0, 30.0, 40.0, 10.0] // Середня до високої складності
          case 4:
              probabilities = [10.0, 20.0, 30.0, 40.0] // Висока складність, більше ймовірності для останніх відповідей
          case 5:
              probabilities = [5.0, 15.0, 30.0, 50.0] // Дуже висока складність, більше ймовірності для останніх відповідей
        default:
            probabilities = Array(repeating: 0.25, count: quiz.answers.answers.count) // Рівномірна ймовірність
        }
        
        return probabilities
    }
    
    static func generateQuestionsProbabilities(for question: Questions) -> [Double] {
        var probabilities = [Double]()
        
        switch question.difficulty {
          case 1:
              probabilities = [40.0, 30.0, 20.0, 10.0] // Низька складність, більше ймовірності для перших відповідей
          case 2:
              probabilities = [30.0, 40.0, 20.0, 10.0] // Низька до середня складність
          case 3:
              probabilities = [20.0, 30.0, 40.0, 10.0] // Середня до високої складності
          case 4:
              probabilities = [10.0, 20.0, 30.0, 40.0] // Висока складність, більше ймовірності для останніх відповідей
          case 5:
              probabilities = [5.0, 15.0, 30.0, 50.0] // Дуже висока складність, більше ймовірності для останніх відповідей
        default:
            probabilities = Array(repeating: 0.25, count: 4) // Рівномірна ймовірність
        }
        
        return probabilities
    }
}
