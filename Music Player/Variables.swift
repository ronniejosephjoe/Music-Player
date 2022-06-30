//
//  Variables.swift
//  Player
//
//  Created by RJ on 12/05/22.
//

import SwiftUI
import AVFoundation


class Variables: ObservableObject{
    
    @Published var Player: AVAudioPlayer!
    @Published var data: Data = .init(count: 1)
    @Published var song = ["Raataan Lambiyan","Pathala Pathala","Levitating","Vilambara Idaiveli","Jab Tak","Jolly-O-Gymkhana","Uyire","Mudhal Nee Mudivum Nee","Naan Pizhaippeno","Yaar Indha Saalai Oram","Unakkenna Venum Sollu","Ranjha"]
    @Published var selectedSong = 0
    @Published var view = false
    @Published var IsPlaying = false
    
//    Launch Screen
    
    @Published var scaleffect = false
    @Published var opacity = 0.6
    
//    ContentView Variables
    
    @Published var currentime = round(0.0)
    @Published var duration = round(0.0)
    @Published var dur = "00:00"
    @Published var crt = "00:00"
    @Published var selectedtitle = ""
    @Published var selectedartist = ""
    @Published var width : CGFloat = 0
    
    func play(){

     
         
            let url = Bundle.main.path(forResource: song[selectedSong], ofType: "mp3")
        Player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
                                       

            
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        
        
        let asset = AVAsset(url: self.Player.url!)
        
        for i in asset.commonMetadata{
            
            if i.commonKey?.rawValue == "artwork"{
                
                let data = i.value as! Data
                self.data = data
            }
            
            if i.commonKey?.rawValue == "title"{
                
                let title = i.value as! String
                self.selectedtitle = title
            }
            
            if i.commonKey?.rawValue == "artist"{
                
                let artist = i.value as! String
                self.selectedartist = artist
            }
        }
        
        duration = Player.duration

    }
    
    func feedback(type: UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    
    func durcrt(){
         let min = Int(round((duration.truncatingRemainder(dividingBy: 3600)) / 60))
         let sec = Int(round((duration.truncatingRemainder(dividingBy: 3600)).truncatingRemainder(dividingBy: 60)))
        
         dur = "\(min):\(sec)"

        let crtmin = Int(round((currentime.truncatingRemainder(dividingBy: 3600)) / 60))
        let crtsec = Int(round((currentime.truncatingRemainder(dividingBy: 3600)).truncatingRemainder(dividingBy: 60)))

        crt = "\(crtmin):\(crtsec)"
        
        
    }
    
}
