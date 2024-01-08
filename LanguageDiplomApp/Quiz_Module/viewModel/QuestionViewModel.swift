//  QuestionViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.

import Foundation

class QuestionViewModel : QuizViewModelType {
    private var quiz = QuestionService()

    func cellQuizViewModel() -> CollectionQuizViewCellViewModelType {
        return CollectionQuizViewCellViewModel(quiz.getQuizes())

    }
    
    func cellQuestionViewModel() -> CollectionQuestionViewCellViewModelType {
        return CollectionQuestionViewCellViewModel(quiz.getQuestions())

    }
}
