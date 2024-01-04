//
//  QuestionViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

class QuestionViewModel : QuizViewModelType {
    
    private var quiz = QuestionService()
    
    func cellViewModel(_ questionType : QuestionType) -> CollectionViewCellViewModelType {
        switch questionType {
        case .QUIZ:
            return CollectionViewCellViewModel(quiz.getQuizes())

        case .QUESTION:
            return CollectionViewCellViewModel(quiz.getQuestions())
        }
    }
}
