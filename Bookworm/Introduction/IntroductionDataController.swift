//
//  IntroductionDataController.swift
//  Bookworm
//
//  Created by Fauzan Dwi Prasetyo on 27/06/23.
//

import CoreData
import Foundation


class IntroductionDataController: ObservableObject {
    let container = NSPersistentContainer(name: "Introduction")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
