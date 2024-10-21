//
//  FurniVisionApp.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

@main
struct FurniVisionApp: App {
    @State private var isActive: Bool = false // State variable to manage the splash screen state

    var body: some Scene {
        WindowGroup {
            ZStack {
                if isActive {
                    ContentView() // Show the main content view after the splash screen
                } else {
                    splashScreen(isActive: $isActive) // Show the splash screen
                }
            }
        }
    }
}
