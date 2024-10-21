//
//  Furniture Style.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

struct FurnitureStyle: View {
    @State private var selectedStyle: String? = nil
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Select Your Furniture Style")
                .font(.custom("Bebas Neue", size: 30))
                .padding()
                .foregroundColor(.black)

            Spacer()

            VStack(spacing: 20) {
                ForEach(furnitureStyles, id: \.self) { style in
                    Button(action: {
                        if selectedStyle == style {
                            selectedStyle = nil
                        } else {
                            selectedStyle = style
                        }
                    }) {
                        HStack {
                            Text(style)
                                .font(.custom("Bebas Neue", size: 24))
                                .foregroundColor(.black)
                            Spacer()
                            if selectedStyle == style {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedStyle == style ? Color.green : Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    }
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

                Button(action: {
                    // Define action for the "Generate" button, possibly passing selectedStyle to the next page
                }) {
                    HStack {
                        Text("Generate")
                            .font(.custom("Bebas Neue", size: 20))
                            .foregroundColor(.black)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                    .frame(width: 185, height: 50)
                    .background(selectedStyle == nil ? Color.gray : Color.green)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
                .disabled(selectedStyle == nil)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .background(Color.white)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    var furnitureStyles: [String] {
        return ["Modern", "Office", "Rustic", "Industrial", "Traditional"]
    }
}

#Preview {
    FurnitureStyle()
}


