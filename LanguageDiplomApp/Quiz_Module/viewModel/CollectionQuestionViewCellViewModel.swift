//
//  CollectionQuizViewCellViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 06.01.24.
//

import Foundation

class CollectionQuestionViewCellViewModel : CollectionQuestionViewCellViewModelType {
        
    private var collectionQuestion : QuestionProtocol?
    var selectedIndexRow: IndexPath?

    
    init(_ collectionQuiz : QuestionProtocol?) {
        self.collectionQuestion = collectionQuiz
    }
    
    var question: String {
        get {
            return collectionQuestion?.question ?? ""
        }
    }
    
    var answers: Answers {
        get {
            return collectionQuestion?.answers ?? Answers(answers: [])
        }
    }
    
    var questionType: QuestionType {
        get {
            return collectionQuestion?.questionType ?? .QUESTION
        }
    }
    
    var questionImage: String {
        get {
            return collectionQuestion?.questionImage ?? "None"
        }
    }
    
    public func selectedRow(indexPath : IndexPath) {
       self.selectedIndexRow = indexPath
   }
    
}
