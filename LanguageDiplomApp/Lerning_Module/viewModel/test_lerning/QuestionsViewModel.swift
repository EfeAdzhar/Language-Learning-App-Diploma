//
//  QuestionViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 27.12.23.
//

import Foundation

class QuestionsViewModel : QuestionViewModelType {
    
    private var questions = QuestionRepository().getQuestions().questions
    private var selectedIndexPath : IndexPath?
    
    func setIndexPath(_ indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func count() -> Int {
        return self.questions!.count
    }
    
    
    func quizCollectionViewCellViewModel() -> QuizCollectionViewCellViewModelType {
        return QuizCollectionViewCellViewModel(question: questions?[selectedIndexPath!.row] ?? Questions())
    }
}
