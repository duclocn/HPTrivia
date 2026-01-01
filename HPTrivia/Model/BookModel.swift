//
//  BookModel.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import Foundation

struct BookModel: Decodable, Identifiable {
    let id: Int
    let image: String
    let questions: [QuestionModel]
    var status: BookStatus
    
    enum BookStatus: Decodable {
        case locked
        case active
        case inactive
    }
}
