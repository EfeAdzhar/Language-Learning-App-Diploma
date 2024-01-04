//
//  QuizProtocol.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

protocol QuizViewModelType {
    func cellViewModel(_ questionType : QuestionType) -> CollectionViewCellViewModelType
}
