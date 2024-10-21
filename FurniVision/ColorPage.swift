//
//  ColorPage.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

struct ColorPage: View {
    var selectedOption: String?

    var body: some View {
        VStack {
            Text("You selected: \(selectedOption ?? "None")")
                .font(.custom("Bebas Neue", size: 30))
                .padding()

            Spacer()

            Text("This is the color page!")
                .font(.custom("Bebas Neue", size: 25))
        }
        .navigationTitle("Color Page")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ColorPage(selectedOption: "Chair")
}
