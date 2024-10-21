//
//  ContentView.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let player: AVPlayer

    var body: some View {
        VideoPlayer(player: player)
            .frame(width: 100, height: 100)
            .onAppear() {
                player.play()
                player.actionAtItemEnd = .none
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                    player.seek(to: .zero)
                    player.play()
                }
            }
            .onDisappear() {
                NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
            }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack {
                Text("Furnish Your Vision!")
                    .font(.custom("Bebas Neue", size: 50))
                    .foregroundColor(.black)
                    .padding(.top,30)

                // Add Video Player here
                VideoPlayerView(player: AVPlayer(url: Bundle.main.url(forResource: "rocking-chair", withExtension: "mp4")!))
                    

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
                    Button(action: {
                        // Define button action here
                    }) {
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
                .font(.custom("Bebas Neue", size: 20))
                .frame(width: 180, height: 120)
                .background(Color.gray)
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
    splashScreen()
}
