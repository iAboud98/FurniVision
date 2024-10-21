//
//  ColorPage.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

struct ColorPage: View {
    var selectedOption: String?

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("You selected: \(selectedOption ?? "None")")
                .font(.custom("Bebas Neue", size: 30))
                .padding()

            Spacer()

            Text("This is the color page!")
                .font(.custom("Bebas Neue", size: 25))

            Spacer()

            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back")
                        .font(.custom("Bebas Neue", size: 20))
                        .frame(width: 185, height: 50)
                        .background(Color(red: 150/255, green: 110/255, blue: 65/255)) // Brown color
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                .padding(0)

                Button(action: {
                    // Define action for the "Next" button
                    // Use navigation logic to go to the next page
                }) {
                    Text("Next")
                        .font(.custom("Bebas Neue", size: 20))
                        .frame(width: 185, height: 50)
                        .background(Color(red: 150/255, green: 110/255, blue: 65/255)) // Original brown color
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Color Page")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ColorPage(selectedOption: "Chair")
}
