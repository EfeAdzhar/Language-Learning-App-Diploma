//
//  QuestionViewControllerViewModelType.swift
//  FilmMatcher
//
//  Created by Efe on 19.11.23.
//

import Foundation

protocol QuestionViewControllerViewModelType {
    var question : Box<String?> {get}
    var variants : Box<[String]?> {get}
}
