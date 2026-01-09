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
    @State private var revealHint: Bool = false
    @State private var revealBook: Bool = false
    @State private var tappedCorrectAnswer: Bool = false
    
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
                    HStack {
                        VStack {
                            if animateViewIn {
                                Image(systemName: "questionmark.app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundStyle(.cyan)
                                    .padding()
                                    .transition(.offset(x: -geo.size.width/2))
                                    .phaseAnimator([false, true]) { content, phase in
                                        content
                                            .rotationEffect(.degrees(phase ? -13 : -17))
                                    } animation: { _ in
                                            .easeInOut(duration: 0.7)
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            revealHint.toggle()
                                        }
                                        sfxAudio(fileName: "page-flip")
                                        game.questionScore -= 1
                                    }
                                    .rotation3DEffect(.degrees(revealHint ? 1440 : 0), axis: (x: 0, y: 1, z: 0))
                                    .scaleEffect(revealHint ? 5 : 1)
                                    .offset(x: revealHint ? geo.size.width/2 : 0)
                                    .opacity(revealHint ? 0 : 1)
                                    .overlay {
                                        Text(game.currentQuestion.hint)
                                            .padding(.leading, 20)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.center)
                                            .opacity(revealHint ? 1: 0)
                                            .scaleEffect(revealHint ? 1.33 : 0)
                                    }
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewIn)
                        
                        Spacer()
                        
                        VStack {
                            if animateViewIn {
                                Image(systemName: "app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundStyle(.cyan)
                                    .overlay {
                                        Image(systemName: "book.closed")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50)
                                            .foregroundStyle(.black)
                                    }
                                    .padding()
                                    .transition(.offset(x: geo.size.width/2))
                                    .phaseAnimator([false, true]) { content, phase in
                                        content
                                            .rotationEffect(.degrees(phase ? 13 : 17))
                                    } animation: { _ in
                                            .easeInOut(duration: 0.7)
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            revealBook.toggle()
                                        }
                                        sfxAudio(fileName: "page-flip")
                                        game.questionScore -= 1
                                    }
                                    .rotation3DEffect(.degrees(revealBook ? -1440 : 0), axis: (x: 0, y: 1, z: 0))
                                    .scaleEffect(revealBook ? 5 : 1)
                                    .offset(x: revealBook ? -geo.size.width/2 : 0)
                                    .opacity(revealBook ? 0 : 1)
                                    .overlay {
                                        Image("hp\(game.currentQuestion.book)")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.trailing, 20)
                                            .opacity(revealBook ? 1: 0)
                                            .scaleEffect(revealBook ? 1.33 : 0)
                                    }
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewIn)
                    }
                    .padding()
                    
                    // MARK: Answers
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(game.answers, id: \.self) { answer in
                            if answer == game.currentQuestion.answer {
                                VStack {
                                    if animateViewIn {
                                        Button {
                                            tappedCorrectAnswer = true
                                            sfxAudio(fileName: "magic-wand")
                                            game.correct()
                                        } label: {
                                            Text(answer)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .padding(10)
                                                .frame(width: geo.size.width/2.15, height: 80)
                                                .background(.green.opacity(0.5))
                                                .clipShape(.rect(cornerRadius: 25))
                                        }
                                        .transition(.scale)
                                    }//If
                                }//VStack
                                .animation(.easeOut(duration: 1).delay(1.5), value: animateViewIn)
                            } else {
                                VStack {
                                    if animateViewIn {
                                        Button {
                                            sfxAudio(fileName: "negative-beeps")
                                            game.questionScore -= 1
                                        } label: {
                                            Text(answer)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .padding(10)
                                                .frame(width: geo.size.width/2.15, height: 80)
                                                .background(.green.opacity(0.5))
                                                .clipShape(.rect(cornerRadius: 25))
                                        }
                                        .transition(.scale)
                                    }//If
                                }//VStack
                                .animation(.easeOut(duration: 1).delay(1.5), value: animateViewIn)
                            }
                        }
                    }
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                Spacer()
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
                //playAMusic()
            }
        }
    }
}

#Preview {
    GameplayView()
        .environment(Game())
}
