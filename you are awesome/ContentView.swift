
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
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
                Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("show message!"){
                let message1 = "You are awesome!"
                let message2 = "You are great!"

                message = ( message == message1 ? message2 : message1)
//                imageName = ( imageName == "image0" ? "image1" : "image0")
                
                //TODO: - update imagename var -
                imageName = "image\(imagenumber)"
//              imagenumber = imagenumber + 1
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
