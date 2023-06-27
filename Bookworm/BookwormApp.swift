//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Fauzan Dwi Prasetyo on 26/06/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
