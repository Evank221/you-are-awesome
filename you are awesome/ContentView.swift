
//
//  ContentView.swift
//  you are awesome
//
//  Created by HARO, EVAN on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imagenumber = 0
    @State private var messagenumber = 0
    
    var body: some View {
       
        VStack {
            Spacer()
            
            Text(message)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(.red)
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.5)
            .frame(height: 120)
            .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("show message!"){
                let messages = ["you are awesome!",
                                "when the genius bar needs help, they call you",
                                "you are great!" ,
                                "you are fantastic!" ,
                                "fabulous? that's you!" ,
                                "you make me smile!"]
                
                message = messages [messagenumber]
                messagenumber += 1
                if messagenumber == messages.count {
                    messagenumber = 0
                }
                
                imageName = "image\(imagenumber)"
                imagenumber += 1
                
                if imagenumber > 9{
                    imagenumber = 0
                }
                print(imagenumber)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
