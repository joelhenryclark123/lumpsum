//
//  LumpsumApp.swift
//  Lumpsum
//
//  Created by Joel Clark on 10/16/20.
//

import SwiftUI

@main
struct LumpsumApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
