//
//  ContentView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animateViewIn = false
    
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
                    .animation(.easeInOut(duration: 0.7).delay(2), value: animateViewIn)
                    
                    Spacer()
                }//VStack
            }// ZStack
            .frame(width: geo.size.width, height: geo.size.height)
        }//Geo
        .ignoresSafeArea()
        .onAppear() {
            animateViewIn = true
            playAudio(fileName: "magic-in-the-air", fileType: "mp3")
        }
    }
}

#Preview {
    ContentView()
}
