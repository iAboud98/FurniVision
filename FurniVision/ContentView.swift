//
//  ContentView.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.brown
                .ignoresSafeArea()

            VStack {
                Text("Welcome to FurniVision")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 120)
                    

                Spacer()
                
                Text("Select a category to start")
                    .font(.title)
                    .foregroundColor(.white)
                
                Grid {
                    GridRow {
                        createButton(title: "chair")
                        createButton(title: "table")
                    }
                    GridRow {
                        createButton(title: "closet")
                        createButton(title: "bed")
                    }
                    GridRow {
                        createButton(title: "couch")
                        createButton(title: "vase")
                    }
                }
                .padding(.bottom, 0)

                HStack {
                    Button(action: {
                        // Define button action here
                    }) {
                        Text("next")
                            .frame(width: 368, height: 80)
                            .background(Color(red: 150/255, green: 110/255, blue: 65/255))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
        }
    }

    func createButton(title: String) -> some View {
        Button(action: {
            // Define button action here
        }) {
            Text(title)
                .frame(width: 180, height: 120)
                .background(Color(red: 150/255, green: 110/255, blue: 65/255))
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
