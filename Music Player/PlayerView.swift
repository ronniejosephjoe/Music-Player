//
//  PlayerView.swift
//  Player
//
//  Created by RJ on 15/05/22.
//

import SwiftUI
import AVFoundation

struct PlayerView: View {
    @EnvironmentObject var use: Variables
    @State var offset: CGSize = .zero
    
    var body: some View {
       
        VStack{
            ContentView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(30)
            .background(
                

                LinearGradient(gradient: Gradient(colors: [Color("blue0"),Color("blue1"),Color("blue2"),Color("blue3")] ), startPoint: .top, endPoint: .bottom)
            )
            .offset(y: offset.height)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        
                        if value.translation.height < 0 {
                           
                        }else{
                            offset = value.translation
                        }
                        
                    }
                    .onEnded{ value in
                        withAnimation{
                            if offset.height >= 300{
                                use.view = false
                            }
                            
                        offset = .zero
                        }
                    }
            )
            
            
   }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView().preferredColorScheme(.dark).background(Library()).environmentObject(Variables())
    }
}
