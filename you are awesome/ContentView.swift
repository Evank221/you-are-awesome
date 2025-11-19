
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
    @State private var lastimagenumber = -1
    @State private var lastmessagenumber = -1 // will never be -1
    
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
                
            
                
                var messagenumber = Int.random(in: 0...messages.count-1)
                repeat{
                        messagenumber = Int.random(in: 0...messages.count-1)
                } while messagenumber == lastmessagenumber
                
                message = messages[messagenumber]
                lastmessagenumber = messagenumber
                
                var imagenumber = Int.random(in: 0...9)
                repeat {
                    imagenumber = Int.random(in: 0...9)
                } while imagenumber == lastimagenumber
                
                imageName = "image\(imagenumber)"
                lastimagenumber = imagenumber
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
