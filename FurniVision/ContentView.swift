//
//  ContentView.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedOption: String? = nil

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack {
                    Text("Furnish Your Vision!")
                        .font(.custom("Bebas Neue", size: 50))
                        .foregroundColor(.black)
                        .padding(.top, 30)

                    Spacer()

                    Text("Explore your furniture options:")
                        .font(.custom("Bebas Neue", size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(0)

                    Grid {
                        GridRow {
                            createButton(title: "Chair")
                            createButton(title: "Table")
                        }
                        GridRow {
                            createButton(title: "Closet")
                            createButton(title: "Bed")
                        }
                        GridRow {
                            createButton(title: "Couch")
                            createButton(title: "Vase")
                        }
                    }
                    .padding(.bottom, 0)

                    HStack {
                        NavigationLink(destination: ColorPage(selectedOption: selectedOption)) {
                            Text("Next")
                                .font(.custom("Bebas Neue", size: 20))
                                .frame(width: 368, height: 80)
                                .background(Color(red: 150/255, green: 110/255, blue: 65/255))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                        .disabled(selectedOption == nil)
                        .opacity(selectedOption == nil ? 0.5 : 1.0)
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }

    func createButton(title: String) -> some View {
        Button(action: {
            if selectedOption == title {
                selectedOption = nil
            } else {
                selectedOption = title
            }
        }) {
            Text(title)
                .font(.custom("Bebas Neue", size: 20))
                .frame(width: 180, height: 120)
                .background(selectedOption == title ? Color.green : Color.gray)
                .foregroundColor(.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
        }
        .padding(0)
    }
}

#Preview {
    ContentView()
}
