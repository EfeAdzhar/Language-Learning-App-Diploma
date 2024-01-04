//
//  CollectionViewCellViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

protocol CollectionViewCellViewModelType {
    var selectedIndexRow : IndexPath? {get}
    var question : String {get}
    var answers : Answers {get}
    var answer : String {get}
    var questionImage : String {get}
    var questionType : QuestionType {get}
    func selectedRow(indexPath : IndexPath)
}
