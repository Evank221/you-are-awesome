
//
//  ContentView.swift
//  you are awesome
//
//  Created by HARO, EVAN on 11/6/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastimagenumber = -1
    @State private var lastmessagenumber = -1 // will never be -1
    @State private var lastsoundnumber = -1
    @State private var audioplayer: AVAudioPlayer!
    let numberofimg = 10 // img labels
    let numberofsounds = 6 //sounds labels
    
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
            
            Spacer()
            
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
                
                var imagenumber: Int
                repeat {
                    imagenumber = Int.random(in: 0...numberofimg-1)
                } while imagenumber == lastimagenumber
                
                imageName = "image\(imagenumber)"
                lastimagenumber = imagenumber
                
                var soundnumber: Int
                repeat {
                    soundnumber = Int.random(in: 0...numberofsounds-1)
                } while soundnumber == lastsoundnumber
                lastsoundnumber = soundnumber
                let soundName = "sound\(soundnumber)"
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                print("😡 could not read file named \(soundName)")
                    return
                }
                do {
                    audioplayer = try AVAudioPlayer (data: soundFile.data)
                    audioplayer.play()
                } catch {
                    print("😡error: \(error.localizedDescription) creating audioPlayer")
                }
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
