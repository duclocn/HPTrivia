//
//  SelectBooksView.swift
//  HPTrivia
//
//  Created by Loc Nguyen on 1/5/26.
//

import SwiftUI

struct SelectBooksView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Game.self) private var game
    
    @State private var showTempAlert = false
    
    var activeBooks: Bool {
        for book in game.bookQuestions.books {
            if book.status == .active {
                return true
            }
        }
        
        return false
    }
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Which books would you like to questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(game.bookQuestions.books) { book in
                            if book.status == .active {
                                ActiveBookView(book: book)
                                    .onTapGesture {
                                        game.bookQuestions.changeStatus(of: book.id, to: .inactive)
                                    }
                            } else if book.status == .inactive {
                                InactiveBookView(book: book)
                                    .onTapGesture {
                                        game.bookQuestions.changeStatus(of: book.id, to: .active)
                                    }
                            } else {
                                LockedBookView(book: book)
                                    .onTapGesture {
                                        showTempAlert.toggle()
                                        game.bookQuestions.changeStatus(of: book.id, to: .active)
                                    }
                            }
                        }
                    }//LazyVGrid
                    .padding()
                }//scrollview
                .foregroundStyle(.black)
                
                if !activeBooks {
                    Text("Please select at least a book to continue.")
                        .multilineTextAlignment(.center)
                }
                
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle)
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .foregroundStyle(.white)
                .disabled(!activeBooks)
            }
        }//ZStack
        .interactiveDismissDisabled(!activeBooks)
        .alert("You purchased a new question pack. Yay!", isPresented: $showTempAlert) {
        }
    }
}

#Preview {
    SelectBooksView()
        .environment(Game())
}
