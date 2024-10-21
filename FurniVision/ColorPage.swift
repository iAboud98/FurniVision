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
    @State private var selectedColors: Set<Color> = []

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("You selected: \(selectedOption ?? "None")")
                    .font(.custom("Bebas Neue", size: 30))
                    .foregroundColor(.black)
                    .padding()

                Spacer()

                Text("Select Your Colors:")
                    .font(.custom("Bebas Neue", size: 24))
                    .foregroundColor(.black)
                    .padding(.bottom, 10)

                HStack {
                    ForEach(Array(selectedColors), id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .onTapGesture {
                                selectedColors.remove(color)
                            }
                    }
                }
                .padding(.bottom, 40)

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
                        colorButton(color: .black)
                    }
                    HStack {
                        colorButton(color: .white)
                        colorButton(color: Color(red: 150/255, green: 110/255, blue: 65/255))
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
                            .background(Color(red: 150/255, green: 110/255, blue: 65/255))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .padding(0)

                    NavigationLink(destination: FurnitureStyle()) {
                        Text("Next")
                            .font(.custom("Bebas Neue", size: 20))
                            .frame(width: 185, height: 50)
                            .background(selectedColors.isEmpty ? Color.gray : Color(red: 150/255, green: 110/255, blue: 65/255))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .disabled(selectedColors.isEmpty)
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }

    func colorButton(color: Color) -> some View {
        Button(action: {
            if selectedColors.contains(color) {
                selectedColors.remove(color)
            } else if selectedColors.count < 3 {
                selectedColors.insert(color)
            }
        }) {
            Circle()
                .fill(color)
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .stroke(selectedColors.contains(color) ? Color.green : Color.black, lineWidth: 4)
                )
        }
    }
}

#Preview {
    ColorPage(selectedOption: "Chair")
}

