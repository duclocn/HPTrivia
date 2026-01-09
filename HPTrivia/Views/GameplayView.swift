//
//  GameplayView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 1/7/26.
//

import SwiftUI

struct GameplayView: View {
    @Environment(Game.self) private var game
    @Environment(\.dismiss) private var dismiss
    
    @State private var animateViewIn: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.hogwarts)
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay {
                        Rectangle()
                            .foregroundStyle(.black.opacity(0.8))
                    }
                
                VStack {
                    // MARK: Controls
                    HStack {
                        Button("End Game") {
                            game.endGame()
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.5))
                        
                        Spacer()
                        
                        Text("Score: \(game.gameScore)")
                    }
                    .padding()
                    .padding(.vertical, 30)
                    
                    // MARK: Question
                    VStack {
                        if animateViewIn {
                            Text(game.currentQuestion.question)
                                .font(.custom("PartyLetPlain", size: 50))
                                .multilineTextAlignment(.center)
                                .padding()
                                .transition(.scale)
                        }
                    }
                    .animation(.easeInOut(duration: 2), value: animateViewIn)
                        
                    Spacer()
                    
                    // MARK: Hints
                    
                    // MARK: Answers
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
                // MARK: Celebration
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .foregroundStyle(.white)
        }
        .ignoresSafeArea()
        .onAppear {
            game.startGame()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                animateViewIn.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                playAMusic()
            }
        }
    }
}

#Preview {
    GameplayView()
        .environment(Game())
}
