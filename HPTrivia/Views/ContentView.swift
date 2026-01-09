//
//  ContentView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/26/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var animateViewIn = false
    @State private var playGame = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BackgroundView(geo: geo)
                
                VStack {
                    GameTitleView(animateViewIn: $animateViewIn)
                    
                    Spacer()
                    
                    RecentScoresView(animateViewIn: $animateViewIn)
                    
                    Spacer()
                    
                    ButtonBarView(animateViewIn: $animateViewIn, playGame: $playGame, geo: geo)
                    
                    Spacer()
                    
                }//VStack
            }// ZStack
            .frame(width: geo.size.width, height: geo.size.height)
            .animation(.easeInOut(duration: 0.7).delay(2), value: animateViewIn)
        }//Geo
        .ignoresSafeArea()
        .onAppear() {
            animateViewIn = true
            playAudio(fileName: "magic-in-the-air", fileType: "mp3")
        }//onAppear
        .fullScreenCover(isPresented: $playGame) {
            GameplayView()
                .onAppear {
                    audioPlayer?.setVolume(0, fadeDuration: 2)
                }
                .onDisappear {
                    audioPlayer?.setVolume(1, fadeDuration: 3)
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(Game())
}
