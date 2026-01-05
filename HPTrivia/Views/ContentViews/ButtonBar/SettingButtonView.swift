//
//  SettingButtonView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import SwiftUI

struct SettingButtonView: View {
    @Binding var animateViewIn: Bool
    @State private var showSettings = false
    
    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            if animateViewIn {
                Button {
                    showSettings.toggle()
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
        .sheet(isPresented: $showSettings) {
            SelectBooksView()
        }
    }
}

#Preview {
    GeometryReader { geo in
        SettingButtonView(animateViewIn: .constant(true), geo: geo)
            .environment(Game())
    }
}
