//
//  CoreDataAndSwiftUI.swift
//  Bookworm
//
//  Created by Fauzan Dwi Prasetyo on 27/06/23.
//

import SwiftUI

struct CoreDataAndSwiftUI: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
//            List(students) { student in
//                Text(student.name ?? "unknown")
//            }
            
            Button("Add") {
//                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

//                let chosenFirstName = firstNames.randomElement()!
//                let chosenLastName = lastNames.randomElement()!
                
//                let student = Student(context: moc)
//                student.id = UUID()
//                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
            .padding()
            .foregroundColor(.white)
            .background(.black)
            .clipShape(Capsule())
        }
    }
}

struct CoreDataAndSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataAndSwiftUI()
    }
}
