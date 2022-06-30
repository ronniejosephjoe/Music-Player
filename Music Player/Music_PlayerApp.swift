//
//  Music_PlayerApp.swift
//  Music Player
//
//  Created by RJ on 08/01/22.
//

import SwiftUI

@main
struct Music_PlayerApp: App {
    @EnvironmentObject var use: Variables
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(Variables())
        }
    }
}
