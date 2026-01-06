//
//  InactiveBookView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 1/6/26.
//

import SwiftUI

struct InactiveBookView: View {
    @State var book: BookModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
                .overlay {
                    Rectangle().opacity(0.5)
                }
            
            Image(systemName: "circle")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.green.opacity(0.5))
                .shadow(radius: 1)
                .padding(3)
        }
    }
}

#Preview {
    InactiveBookView(book: BookQuestions().books[0])
}
