//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by youngjin son on 2/23/23.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
