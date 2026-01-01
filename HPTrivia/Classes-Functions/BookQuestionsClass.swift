//
//  BookQuestionsClass.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import Foundation

@Observable
class BookQuestions {
    var books: [BookModel] = []
    
    init() {
        let decodedQuestions = decodeQuestions()
        let organizedQuestions = organizeQuestions(decodedQuestions)
        populateBooks(with: organizedQuestions)
    }
    
    private func decodeQuestions() -> [QuestionModel] {
        var decodedQuestions: [QuestionModel] = []
        
        if let url = Bundle.main.url(forResource: "trivia", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                decodedQuestions = try JSONDecoder().decode([QuestionModel].self, from: data)
            } catch {
                print("Error decoding questions: \(error)")
            }
        }
        return decodedQuestions
    }
    
    private func organizeQuestions(_ questions: [QuestionModel]) -> [[QuestionModel]] {
        var organizedQuestions: [[QuestionModel]] = [[], [], [], [], [], [], []]
        
        for question in questions {
            organizedQuestions[question.book].append(question)
        }
        
        return organizedQuestions
    }
    
    private func populateBooks(with organizedQuestions: [[QuestionModel]]) {
        books.append(BookModel(id: 1, image: "hp1", questions: organizedQuestions[1], status: .active))
        books.append(BookModel(id: 2, image: "hp2", questions: organizedQuestions[2], status: .active))
        books.append(BookModel(id: 3, image: "hp3", questions: organizedQuestions[3], status: .inactive))
        books.append(BookModel(id: 4, image: "hp4", questions: organizedQuestions[4], status: .locked))
        books.append(BookModel(id: 5, image: "hp5", questions: organizedQuestions[5], status: .locked))
        books.append(BookModel(id: 6, image: "hp6", questions: organizedQuestions[6], status: .locked))
        books.append(BookModel(id: 7, image: "hp7", questions: organizedQuestions[7], status: .locked))
    }
}
