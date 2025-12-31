//
//  IntroductionButtonView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import SwiftUI

struct IntroductionButtonView: View {
    @Binding var animateViewIn: Bool
    @State private var showInstruction = false
    
    let geo: GeometryProxy
    
    var body: some View {
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
        .sheet(isPresented: $showInstruction) {
            IntroductionScreenView()
        }
    }
}

#Preview {
    GeometryReader { geo in
        IntroductionButtonView(animateViewIn: .constant(true), geo: geo)
    }
}
