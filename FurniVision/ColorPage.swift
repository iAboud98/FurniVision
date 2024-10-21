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
    @State private var selectedColor: Color = .clear // Default color

    var body: some View {
        VStack {
            Text("You selected: \(selectedOption ?? "None")")
                .font(.custom("Bebas Neue", size: 30))
                .padding()
            
            Spacer()

            // Prompt text for selecting colors
            Text("Select Your Colors:")
                .font(.custom("Bebas Neue", size: 24))
                .padding(.bottom, 10)

            // Display the selected color
            Circle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
                .padding()

            // Color buttons divided into two rows
            VStack {
                HStack {
                    colorButton(color: .red)
                    colorButton(color: .green)
                    colorButton(color: .blue)
                }
                HStack {
                    colorButton(color: .yellow)
                    colorButton(color: .orange)
                    colorButton(color: .purple)
                }
                HStack {
                    colorButton(color: .pink)
                    colorButton(color: .gray)
                    colorButton(color: .black) // Added black
                }
                HStack {
                    colorButton(color: .white) // Added white
                    colorButton(color: Color(red: 150/255, green: 110/255, blue: 65/255)) // Brown color
                }
            }
            .padding()

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
                        .background(Color(red: 150/255, green: 110/255, blue: 65/255)) // Brown color
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

    // Function to create color buttons
    func colorButton(color: Color) -> some View {
        Button(action: {
            selectedColor = color // Set the selected color
        }) {
            Circle()
                .fill(color)
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2) // Border for visibility
                )
        }
    }
}

#Preview {
    ColorPage(selectedOption: "Chair")
}
