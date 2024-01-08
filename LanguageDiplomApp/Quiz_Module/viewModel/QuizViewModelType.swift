//
//  QuizProtocol.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

protocol QuizViewModelType {
    func cellQuizViewModel() -> CollectionQuizViewCellViewModelType
    func cellQuestionViewModel() -> CollectionQuestionViewCellViewModelType
}
