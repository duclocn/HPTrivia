//
//  ButtonBarView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 12/31/25.
//

import SwiftUI

struct ButtonBarView: View {
    @Binding var animateViewIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        HStack {
            Spacer()
            
            // Introductions Button
            IntroductionButtonView(animateViewIn: $animateViewIn, geo: geo)
            
            Spacer()
            
            PlayButtonView(animateViewIn: $animateViewIn, geo: geo)
            
            Spacer()
            
            // Settings Button
            SettingButtonView(animateViewIn: $animateViewIn, geo: geo)
            
            Spacer()
        }// VStack
        .frame(width: geo.size.width)
    }
}

#Preview {
    GeometryReader { geo in
        ButtonBarView(animateViewIn: .constant(true), geo: geo)
    }
}
