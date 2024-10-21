//
//  FurniVisionApp.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

@main
struct FurniVisionApp: App {
    @State private var isActive: Bool = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if isActive {
                    ContentView()
                } else {
                    splashScreen(isActive: $isActive)
                }
            }
        }
    }
}
