//
//  MotherView.swift
//  Player
//
//  Created by RJ on 14/05/22.
//

import SwiftUI
import AVFoundation

struct MotherView: View {
    
    @EnvironmentObject var use: Variables
    @State var LaunchDone = false
    
  
    var body: some View {
        ZStack{
            
            if LaunchDone == true{
            
            Library()
    
            if use.view {
                withAnimation{
            PlayerView()
                    .transition(.move(edge: .bottom))
                }
          }
            }else{
                LaunchScreen()
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5
            ) {
                withAnimation{

                    use.scaleffect.toggle()
                    LaunchDone = true
                }
            }
        }
    }
}


struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(Variables())
    }
}
