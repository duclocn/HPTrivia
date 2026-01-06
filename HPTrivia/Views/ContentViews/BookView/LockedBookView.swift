//
//  LockedBookView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 1/6/26.
//

import SwiftUI

struct LockedBookView: View {
    @State var book: BookModel
    
    var body: some View {
        ZStack {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
                .overlay {
                    Rectangle().opacity(0.75)
                }
            
            Image(systemName: "lock.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .shadow(color: .white, radius: 2)
        }
    }
}

#Preview {
    LockedBookView(book: BookQuestions().books[0])
}
