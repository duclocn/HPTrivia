//
//  QuestionModel.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/26/25.
//

import Foundation

struct QuestionModel: Decodable {
    let id: Int
    let question: String
    let answer: String
    let wrong: [String]
    let book: Int
    let hint: String
}
