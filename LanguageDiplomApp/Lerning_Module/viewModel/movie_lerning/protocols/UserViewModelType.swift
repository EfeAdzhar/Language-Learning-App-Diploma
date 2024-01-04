//
//  RegistrationViewModelType.swift
//  FilmMatcher
//
//  Created by Efe on 20.11.23.
//

import Foundation

protocol UserViewModelType {
    var name : Box<String?> {get}
    var username : Box<String?> {get}
    var email : Box<String?> {get}
    var password : Box<String?> {get}
    var confirmPassword : Box<String?> {get}
    var data : Box<String?> {get}
    var gender : Box<String?> {get}
}
