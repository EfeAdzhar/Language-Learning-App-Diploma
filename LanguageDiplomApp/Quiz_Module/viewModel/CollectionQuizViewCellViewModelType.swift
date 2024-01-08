//
//  CollectionQuestionViewCellViewModelType.swift
//  LanguageDiplomApp
//
//  Created by Efe on 06.01.24.
//

import Foundation

protocol CollectionQuizViewCellViewModelType {
    var selectedIndexRow : IndexPath? {get}
    var question : String {get}
    var answers : Answers {get}
    var answer : String {get}
    var questionImage : String {get}
    var questionType : QuestionType {get}
    var priorProbabilities: [Double]? { get }
    var difficulty: Int { get }
    
    func selectedRow(indexPath : IndexPath)
}


