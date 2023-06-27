//
//  DetailView.swift
//  Bookworm
//
//  Created by Fauzan Dwi Prasetyo on 27/06/23.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    // challenge 3
    var formattedDate: String {
        guard let date = book.date else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return "Reviewed on \(formatter.string(from: date))"
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author ")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Review")
                .padding()
            
            // challenge 3
            Text(formattedDate)
                .padding(.bottom, 20)
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//
//    static var previews: some View {
//        let book = Book(context: moc)
//        book.title = "Test Title"
//        book.author = "Test Author"
//        book.genre = "Fantasy"
//        book.review = "Test Review"
//        book.rating = 4
//
//        return NavigationView {
//            DetailView(book: book)
//        }
//    }
//}
