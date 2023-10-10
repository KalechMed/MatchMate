//
//  MatchMateApp.swift
//  MatchMate
//
//  Created by Mohamed  on 23/9/2023.
//

import SwiftUI
import AVFoundation


@main
struct MatchMateApp: App {
    @ObservedObject private var audioManager = AudioManager.shared
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .onAppear {
                    audioManager.playBackgroundMusic()
                    
                }
        }
    }
}
