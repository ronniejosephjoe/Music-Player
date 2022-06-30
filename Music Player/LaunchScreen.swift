//
//  LaunchScreen.swift
//  Player
//
//  Created by RJ on 30/05/22.
//

import SwiftUI

struct LaunchScreen: View {
    
    
    @EnvironmentObject var use:Variables
   

  
    var body: some View {
        
        VStack{
            Spacer()
               
            LinearGradient(gradient: Gradient(colors: [.blue,.indigo,.purple,.red,] ), startPoint: .bottomLeading, endPoint: .trailing).frame(width: 250, height: 250)
                .mask( Text("Music").font(.system(size: 80)).bold())

                .scaleEffect(use.scaleffect ? 70 : 1)
            Spacer()
            Text("FROM").foregroundColor(.gray)
            Image("logo").resizable().frame(width: 60, height: 40)
                                
        }
           
          
        
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen().environmentObject(Variables())
            .preferredColorScheme(.light)
            
    }
}
