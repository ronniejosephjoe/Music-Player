//
//  Library.swift
//  Player
//
//  Created by RJ on 12/05/22.
//

import SwiftUI
import AVFoundation

struct Library: View {
    
    @State var Player: AVAudioPlayer!
    @State var data: Data = .init(count: 1)

    @State var titleven = ["","","","","","","","","","","","","","","","","","","",""]
    @State var titleodd = ["","","","","","","","","","","","","","","","","","","",""]
    
    
  
    
    @EnvironmentObject var use: Variables
    
    var body: some View {
        
        NavigationView{
            VStack{
            
                ScrollView(showsIndicators: false){
                    
                    HStack(spacing: 20){
                        VStack(spacing:20){
                            
                            ForEach(0..<use.song.count,id:\.self){ i in
                                
                                if titleven[i] == ""{
                                    
                                }else{
                                    
                                    Button(action: {
                                        
                                        action(change: i)
                                        
                                        
                                    }){
                                        ZStack{
                                            

                                            
                                            VStack{
                                                
                                                Image(uiImage: self.data.count == 1 ? UIImage(named: "itunes")! : UIImage(data: self.data)!).resizable().frame(width: 140, height: 140).cornerRadius(10).padding().shadow(color: .black.opacity(0.2), radius: 4, x: 5, y: 5)
                                                
                                                
                                                
                                                Text(titleven[i]).bold().foregroundColor(Color("Color")).frame(width: 150,height : 40)
                                                
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                        
                        VStack(spacing: 20){
                            
                            ForEach(0..<use.song.count,id:\.self){ i in
                                
                                if titleodd[i] == ""{
                                    
                                }else{
                                    
                                    Button(action: {
                                        
                                        action(change: i)
                                        
                                        
                                    }){
                                        ZStack{
                                            
                                            
                                            VStack{
                                                
                                                
                                                Image(uiImage: self.data.count == 1 ? UIImage(named: "itunes")! : UIImage(data: self.data)!).resizable().frame(width: 140, height: 140).cornerRadius(10).padding().shadow(color: .black.opacity(0.2), radius: 4, x: 5, y: 5)
                                                
                                                
                                                
                                                Text(titleodd[i]).bold().foregroundColor(Color("Color")).frame(width: 150,height : 40)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                                
                            }
                        }
                   
                    }
                
                
                
                
                ZStack{
                    
                    Rectangle().frame(width: 380, height: 100, alignment: .bottomTrailing).cornerRadius(35).foregroundColor(.gray.opacity(0.2))
                    
                    HStack{
                        
                        Image(uiImage: self.use.data.count == 1 ? UIImage(named: "itunes")! : UIImage(data: self.use.data)!).resizable().frame(width: 90, height: 60).cornerRadius(0).padding(.leading, 25).offset(x: -50)
                            .onTapGesture {
                                withAnimation{
                                    
                                    use.view.toggle()
                                    
                                }
//                                use.Player.pause()
                            }
                        
                       
                        
                        VStack(spacing: 20){
                            
                            Text(use.selectedtitle).fontWeight(.medium).frame(width: 150, height: 10)
                            
                            HStack(spacing: 30){
                            
                            Button(action:{
                                
                                if use.selectedSong == 0{

                                use.play()
                                use.Player.play()
                                    use.IsPlaying = true
                                }else{
                                    use.selectedSong -= 1
                                    use.play()
                                    use.Player.play()
                                    use.IsPlaying = true
                                }
                                use.feedback(type: .success)
                                
                            }){
                                Image(systemName: "backward.circle.fill").resizable().frame(width: 25, height: 25).foregroundColor(.gray)
                            }
                            
                            Button(action: {
                                
                                if use.selectedtitle == ""{
                                    
                                    use.play()
                                    
                                }
                                
                                if use.IsPlaying == false {
                                    use.IsPlaying = true
                                    
                                    use.feedback(type: .success)
                                    use.Player.play()
                                    
                                }else{
                                    use.IsPlaying = false
                                    use.feedback(type: .error)
                                    use.Player.pause()
                                }
                                
                               
                            }){
                                if use.IsPlaying == false {
                                    Image(systemName: "play.circle.fill").resizable().frame(width: 25, height: 25).foregroundColor(.gray)
                                }else{
                                    Image(systemName: "pause.circle.fill").resizable().frame(width: 25, height: 25).foregroundColor(.gray)
                                }
                                
                            
                            }
                            
                            Button(action:{
                                
                                if use.selectedSong != use.song.count-1{
                                use.selectedSong += 1
                                use.play()
                                use.Player.play()
                                    use.IsPlaying = true
                                }else{
                                    use.selectedSong = 0
                                    use.play()
                                    use.Player.play()
                                    use.IsPlaying = true
                                }
                                
                                use.feedback(type: .success)
                            }){
                                Image(systemName: "forward.circle.fill").resizable().frame(width: 25, height: 25).foregroundColor(.gray)
                            }
                                
                            }
                            
    
                        }
                    }
                }.offset(y: 15)
                
                
            }.navigationTitle("Library")

            
                .onAppear{
                    for use in 0..<use.song.count{
                        
                        play(select: use)
                    }
                   
                }
        }
        
    }
    
    func action(change: Int){
        
        use.selectedtitle = titleven[change]
        use.selectedSong = change
        use.play()
        use.Player.play()
        use.IsPlaying = true
    }
    
    
    
    
    func play(select: Int ){
        
        
        let url = Bundle.main.path(forResource: use.song[select], ofType: "mp3")
        Player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        
        
        let asset = AVAsset(url: self.Player.url!)
        
        for i in asset.commonMetadata{
            
//                            if i.commonKey?.rawValue == "artwork"{
//
//                                let data = i.value as! Data
//                                self.use.data = data
//                            }
            
            if i.commonKey?.rawValue == "title"{
                
                let title = i.value as! String
                if select%2 == 0 {
                self.titleven[select] = title
                }else{
                    self.titleodd[select] = title
                }
            }
        }
    }
    
    
}



struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library().preferredColorScheme(.dark).environmentObject(Variables())
    }
}
