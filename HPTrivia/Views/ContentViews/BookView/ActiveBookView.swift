//
//  ActiveBookView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 1/6/26.
//

import SwiftUI

struct ActiveBookView: View {
    @State var book: BookModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
            
            Image(systemName: "checkmark.circle.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.green)
                .shadow(radius: 1)
                .padding(3)
        }
    }
}

#Preview {
    ActiveBookView(book: BookQuestions().books[0])
}
