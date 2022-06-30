//
//  ContentView.swift
//  Player
//
//  Created by RJ on 10/05/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    
    @EnvironmentObject var use: Variables
    

    
    var body: some View {
        
      
 
            
        VStack(spacing: 20){
                
                
                
                RoundedRectangle(cornerRadius:3).frame(width: 40, height: 5).foregroundColor(Color.gray).padding()
                
               
           
                Spacer()
                
              
                    VStack{
                    
                        Image(uiImage: self.use.data.count == 1 ? UIImage(named: "itunes")! : UIImage(data: self.use.data)!).resizable().frame(width: 240, height: 250).cornerRadius(20).padding()
                
                      
                    
                   }
                
                
            

                ZStack(alignment: .leading) {


                    Capsule().fill(Color.gray).frame(width:300,height: 8)

                    Capsule().fill(Color.red).frame(width: self.use.width, height: 8)
                    Image(systemName: "record.circle.fill").foregroundColor(.white).frame(width: 10, height: 10).offset(x: use.width)
                        .gesture(DragGesture()
                            .onChanged({ (value) in

                                let x = value.location.x

                                self.use.width = x




                            }).onEnded({ (value) in

                                let x = value.location.x

                                let screen = UIScreen.main.bounds.width - 100

                                let percent = x / screen

                                self.use.Player.currentTime = Double(percent) * self.use.Player.duration


                            }))
                }
            
            HStack(spacing:200){
                
                Text(use.crt).foregroundColor(Color("Color0"))
            Text(use.dur).foregroundColor(Color("Color0"))
                
            }
                
                
                HStack(spacing: 30){
                    
                   
                    
                    Button(action:{
                        
                        if use.selectedSong != 0 {
                        use.selectedSong -= 1
                        use.play()
                        use.Player.play()
                        }else {
                            use.selectedSong = 0
                            use.play()
                            use.Player.play()
                        }
                        
                        use.IsPlaying = true
                        use.durcrt()
                    }){
                        Image(systemName: "backward.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color("Color0"))
                    }
                    
                  
                    
                    Button(action:{
                        if use.IsPlaying == false{
                            use.IsPlaying = true
                            
                            
                            use.Player.play()
                            
                        }else{
                            
                            use.IsPlaying = false
                            use.Player.pause()
                            
                        }
                    }){
                        if use.IsPlaying == false{
                            Image(systemName: "arrowtriangle.right.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color("Color0"))
                        }else{
                            Image(systemName: "pause.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color("Color0"))
                        }
                        
                    }
                    
                 
                    
                    Button(action:{
                        
                        if use.selectedSong != use.song.count-1{
                        use.selectedSong += 1
                        use.play()
                        use.Player.play()
                        }else{
                            use.selectedSong = 0
                            use.play()
                            use.Player.play()
                        }
                        
                        use.IsPlaying = true
                        use.durcrt()
                    }){
                        Image(systemName: "forward.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color("Color0"))
                    }
                    
                 
                  
                }.offset(y: -20)
            
            
            Text(use.selectedtitle).bold().foregroundColor(Color("Color0"))
            Text(use.selectedartist).font(.system(size: 12)).bold().frame(width: 360).foregroundColor(Color("Color0"))
            
            
                
           Spacer()
               
            }
        

        
         
            .onAppear{
               
              

                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in

                    if self.use.Player.isPlaying{

                        let screen = UIScreen.main.bounds.width - 100

                        let value = self.use.Player.currentTime / self.use.Player.duration

                        self.use.width = screen * CGFloat(value)

                        use.currentime = use.Player.currentTime
                        use.durcrt()

                        if use.dur == use.crt {

                            if use.selectedSong != use.song.count-1{
                            use.selectedSong += 1
                            use.play()
                            use.Player.play()
                            }else{
                                use.selectedSong = 0
                                use.play()
                                use.Player.play()
                            }
                        }

                    }
                }
                

            }
    
    }
   
    
}
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark).environmentObject(Variables())
    }
}
