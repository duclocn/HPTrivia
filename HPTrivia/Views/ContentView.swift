//
//  ContentView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animateViewIn = false
    @State private var scalePlayButton = false
    @State private var showInstruction = false
    @State private var showSettings = false
    @State private var playGame = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.hogwarts)
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                    .phaseAnimator([false, true]) { content, phase in
                        content
                            .offset(x: phase ? geo.size.width / 1.1 : -geo.size.width / 1.1)
                    } animation: { _ in
                            .linear(duration: 60)
                    }
                
                VStack {
                    VStack {
                        if animateViewIn {
                            VStack {
                                Image(systemName: "bolt.fill")
                                    .imageScale(.large)
                                    .font(.largeTitle)
                                
                                Text("HP")
                                    .font(.custom("PartyLetPlain", size: 70))
                                    .padding(.bottom, -50)
                                
                                Text("Trivia")
                                    .font(.custom("PartyLetPlain", size: 60))
                                
                            } //Vstack
                            .padding(.top, 70)
                            .transition(.move(edge: .top))
                        }//if
                    }//VStack
                    
                    Spacer()
                    VStack {
                        if animateViewIn {
                            VStack {
                                Text("Recent Scores")
                                    .font(.title2)
                                
                                Text("33")
                                Text("27")
                                Text("15")
                            }// VStack
                            .foregroundStyle(.white)
                            .font(.title3)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                            .background(.black.opacity(0.7))
                            .clipShape(.rect(cornerRadius: 15))
                            .transition(.opacity)
                        }
                    }
                    .animation(.linear(duration: 1).delay(4), value: animateViewIn)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        // Introductions Button
                        VStack {
                            if animateViewIn {
                                Button {
                                    showInstruction.toggle()
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .shadow(radius: 5)
                                }
                                .transition(.offset(x: -geo.size.height / 4))
                            }
                        }
                        .animation(.easeInOut(duration: 0.7).delay(2.7), value: animateViewIn)
                        
                        Spacer()
                        
                        VStack {
                            if animateViewIn {
                                Button {
                                    playGame.toggle()
                                } label: {
                                    Text("Play")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 7)
                                        .padding(.horizontal, 50)
                                        .background(.brown)
                                        .clipShape(.rect(cornerRadius: 7))
                                        .shadow(radius: 5)
                                        .scaleEffect(scalePlayButton ? 1.2 : 1)
                                        .onAppear() {
                                            withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                                scalePlayButton.toggle()
                                            }
                                        }
                                }
                                .transition(.offset(y: geo.size.height / 3))
                            }// if
                        }
                        
                        Spacer()
                        
                        // Settings Button
                        VStack {
                            if animateViewIn {
                                Button {
                                    showInstruction.toggle()
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .shadow(radius: 5)
                                }
                                .transition(.offset(x: geo.size.height / 4))
                            }
                        }
                        .animation(.easeInOut(duration: 0.7).delay(2.7), value: animateViewIn)
                        
                        Spacer()
                    }// VStack
                    .frame(width: geo.size.width)
                    
                    Spacer()
                    
                }//VStack
            }// ZStack
            .frame(width: geo.size.width, height: geo.size.height)
            .animation(.easeInOut(duration: 0.7).delay(2), value: animateViewIn)
        }//Geo
        .ignoresSafeArea()
        .onAppear() {
            animateViewIn = true
            //playAudio(fileName: "magic-in-the-air", fileType: "mp3")
        }//onAppear
        .sheet(isPresented: $showInstruction) {
            IntroductionScreenView()
        }
    }
}

#Preview {
    ContentView()
}
