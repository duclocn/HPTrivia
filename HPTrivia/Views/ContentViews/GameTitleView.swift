//
//  GameTitleView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import SwiftUI

struct GameTitleView: View {
    @Binding var animateViewIn: Bool
    
    var body: some View {
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
    }
}

#Preview {
    GameTitleView(animateViewIn: .constant(true))
}
