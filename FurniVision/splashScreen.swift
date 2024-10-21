//
//  splachScreen.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

struct splashScreen: View {
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .offset(x: 0, y: -50)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    splashScreen(isActive: .constant(false))
}

