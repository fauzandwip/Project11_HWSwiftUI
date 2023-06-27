//
//  AddBookView.swift
//  Bookworm
//
//  Created by Fauzan Dwi Prasetyo on 27/06/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Names of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("SAVE") {
                        let book = Book(context: moc)
                        book.id = UUID()
                        book.title = title
                        book.author = author
                        book.genre = genre
                        book.review = review
                        book.rating = Int16(rating)
                        book.date = Date.now
                        
                        try? moc.save()
                        dismiss()
                    }
                    // challenge 1
                    .disabled(!isDisable)
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    // challenge 1
    var isDisable: Bool {
        if title.isEmpty || author.isEmpty {
            return false
        }
        
        if title.isOnlySpaces || author.isOnlySpaces {
            return false
        }
        
        return true
    }
}

// challenge 1
extension String {
    var isOnlySpaces: Bool {
        return self.drop(while: { $0 == " "}).isEmpty
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
