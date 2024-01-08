//
//  CollectionViewCellViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 19.12.23.
//

import Foundation

class CollectionQuizViewCellViewModel : CollectionQuizViewCellViewModelType {
    
    private var collectionQuiz : QuizProtocol?
    
    init(_ collectionQuiz : QuizProtocol?) {
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
                let quiz = collectionQuiz
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
    
    var priorProbabilities: [Double]? {
        get {
            return collectionQuiz?.priorProbabilities
        }
    }
    
    var difficulty: Int {
        get {
            return collectionQuiz!.difficulty
        }
    }
    
     public func selectedRow(indexPath : IndexPath) {
        self.selectedIndexRow = indexPath
    }
}
