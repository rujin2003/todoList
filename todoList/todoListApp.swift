//
//  todoListApp.swift
//  todoList
//
//  Created by Rujin Devkota on 30/11/2022.
//

import SwiftUI

@main
struct todoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
