//
//  GameplayView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 1/7/26.
//

import SwiftUI

struct GameplayView: View {
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
                    
                    // MARK: Question
                    
                    // MARK: Hints
                    
                    // MARK: Answers
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
                // MARK: Celebration
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GameplayView()
}
