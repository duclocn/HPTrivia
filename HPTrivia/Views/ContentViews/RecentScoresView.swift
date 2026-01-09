//
//  RecentScoresView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import SwiftUI

struct RecentScoresView: View {
    @Environment(Game.self) private var game
    @Binding var animateViewIn: Bool
    
    var body: some View {
        VStack {
            if animateViewIn {
                VStack {
                    Text("Recent Scores")
                        .font(.title2)
                    
                    Text("\(game.recentScores[0])")
                    Text("\(game.recentScores[1])")
                    Text("\(game.recentScores[2])")
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
    }
}

#Preview {
    RecentScoresView(animateViewIn: .constant(true))
        .environment(Game())
}
