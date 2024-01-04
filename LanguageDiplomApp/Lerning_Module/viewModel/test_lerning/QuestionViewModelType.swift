//
//  QuestionViewModelType.swift
//  LanguageDiplomApp
//
//  Created by Efe on 28.12.23.
//

import Foundation

protocol QuestionViewModelType {
    func setIndexPath(_ indexPath : IndexPath)
    func count() -> Int
    func quizCollectionViewCellViewModel() -> QuizCollectionViewCellViewModelType
}
