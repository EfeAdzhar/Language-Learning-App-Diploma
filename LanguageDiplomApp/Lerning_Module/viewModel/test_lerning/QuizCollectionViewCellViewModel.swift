//
//  QuizCollectionViewCellViewModel.swift
//  LanguageDiplomApp
//
//  Created by Efe on 28.12.23.
//

import Foundation

class QuizCollectionViewCellViewModel : QuizCollectionViewCellViewModelType {
    private var domain : Questions?
    
    init(question : Questions) {
        self.domain = question
    }
    var correct_answer: String? {
        get {
            return self.domain?.correct_answer
        }
    }
    
    var option_1: String? {
        get {
            return self.domain?.option_1
        }
    }
    
    var option_2: String? {
        get {
            return self.domain?.option_2
        }
    }
    
    var option_3: String? {
        get {
            return self.domain?.option_3
        }
    }
    
    var option_4: String? {
        get {
            return self.domain?.option_4
        }
    }

    var question: String? {
        get {
            return self.domain?.question
        }
    }
}
