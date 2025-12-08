
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
                
                lastmessagenumber = nonRepeatingRandom(lastnumber: lastmessagenumber, upperBound: messages.count-1)
                message = messages[lastmessagenumber]
                
                lastimagenumber = nonRepeatingRandom(lastnumber: lastimagenumber, upperBound: numberofimg-1)
                imageName = "image\(lastimagenumber)"
                
                lastsoundnumber = nonRepeatingRandom(lastnumber: lastsoundnumber, upperBound: numberofsounds-1)
                playSound(soundName: "sound\(lastsoundnumber)")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastnumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastnumber
        return newNumber
        
    }
    
    func playSound(soundName: String){
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
}

#Preview {
    ContentView()
}
