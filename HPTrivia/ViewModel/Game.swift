//
//  Game.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 1/5/26.
//

import SwiftUI

@Observable
class Game {
    var bookQuestions = BookQuestions()
    
    var gameScore = 0
    var questionScore = 5
    var recentScores = [0, 0, 0]
    
    var activeQuestion: [QuestionModel] = []
    var answeredQuestion: [Int] = []
    var currentQuestion: QuestionModel = try! JSONDecoder().decode([QuestionModel].self, from: Data(contentsOf: Bundle.main.url(forResource: "trivia", withExtension: "json")!))[0]
    var answer: [String] = []
    
    func startGame() {
        for book in bookQuestions.books {
            if book.status == .active {
                for question in book.questions {
                    activeQuestion.append(question)
                }
            }
        }
        
        newQuestion()
    }
    
    func newQuestion() {
        
    }
    
    func correct() {
        
    }
    
    func endGame() {
        recentScores[2] = recentScores[1]
        recentScores[1] = recentScores[0]
        recentScores[0] = gameScore
        
        gameScore = 0
        activeQuestion = []
        answeredQuestion = []
    }
}
