//
//  LittleLemonRestaurantOrderAppApp.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//

import SwiftUI

@main
struct LittleLemonRestaurantOrderAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            OnboardingView()
        }
    }
}
