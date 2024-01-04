//
//  CollectionViewCellViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 19.12.23.
//

import Foundation

class CollectionViewCellViewModel : CollectionViewCellViewModelType {
    
    private var collectionQuiz : QuestionProtocol?
    
    init(_ collectionQuiz : QuestionProtocol?) {
        self.collectionQuiz = collectionQuiz
    }
  
    var selectedIndexRow: IndexPath?

    var question: String {
        get {
            return collectionQuiz?.question ?? ""
        }
    }
    
    var answers: Answers {
        get {
            return collectionQuiz?.answers ?? Answers(answers: [])
        }
    }
    
    var answer: String {
        get {
            if(questionType == .QUIZ) {
                let quiz = collectionQuiz as? QuizProtocol
                return quiz!.answer
            } else {
                return ""
            }
    }
}
    
    var questionImage: String {
        get {
            return collectionQuiz?.questionImage ?? ""
        }
    }
    
    var questionType: QuestionType {
        get {
            return collectionQuiz!.questionType
        }
    }
    
     public func selectedRow(indexPath : IndexPath) {
        self.selectedIndexRow = indexPath
    }
}
