//
//  QuizCollectionViewCellViewModelType.swift
//  LanguageDiplomApp
//
//  Created by Efe on 28.12.23.
//

import Foundation

protocol QuizCollectionViewCellViewModelType {
    var correct_answer: String? {get}
    var option_1: String? {get}
    var option_2: String? {get}
    var option_3: String? {get}
    var option_4: String? {get}
    var question: String? {get}
}
