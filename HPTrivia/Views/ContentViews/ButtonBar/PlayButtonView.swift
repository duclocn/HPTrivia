//
//  PlayButtonView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import SwiftUI

struct PlayButtonView: View {
    @Binding var animateViewIn: Bool
    @State private var scalePlayButton = false
    @State private var playGame = false
    
    let geo: GeometryProxy
    
    var body: some View {
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
    }
}

#Preview {
    GeometryReader { geo in
        PlayButtonView(animateViewIn: .constant(true), geo: geo)
    }
}
