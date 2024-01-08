//
//  CollectionViewCellViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

protocol CollectionQuestionViewCellViewModelType {
    var question : String {get}
    var answers : Answers {get}
    var questionType : QuestionType {get}
    var questionImage : String {get}
    
    func selectedRow(indexPath : IndexPath)
}
