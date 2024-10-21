//
//  splachScreen.swift
//  FurniVision
//
//  Created by Aboud Fialah on 21/10/2024.
//

import SwiftUI

struct splashScreen: View {
    @State var isActive : Bool = false
        
        var body: some View {
            ZStack {
                
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                if self.isActive {
                    ContentView()
                }else{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .offset(x: 0, y: -50)
                    
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now()+3){
                    withAnimation(){
                        self.isActive = true
                    }
                }
            }
        }
}

#Preview {
    splashScreen()
}
