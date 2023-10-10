//
//  MusicManager.swift
//  MatchMate
//
//  Created by Mohamed  on 10/10/2023.
//


import AVFoundation

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    
    private var backgroundMusicPlayer: AVAudioPlayer?
    private var gameOverMusicPlayer: AVAudioPlayer?
    
    private init() {
        // Load the background music
        if let backgroundMusicURL = Bundle.main.url(forResource: "Background", withExtension: "mp3") {
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: backgroundMusicURL)
                backgroundMusicPlayer?.numberOfLoops = -1 // Loop indefinitely
            } catch {
                print("Error loading background music: \(error.localizedDescription)")
            }
        }
        
        // Load the game over music
        if let gameOverMusicURL = Bundle.main.url(forResource: "GameOver", withExtension: "mp3") {
            do {
                gameOverMusicPlayer = try AVAudioPlayer(contentsOf: gameOverMusicURL)
            } catch {
                print("Error loading game over music: \(error.localizedDescription)")
            }
        }
    }
    
    func playBackgroundMusic() {
        backgroundMusicPlayer?.play()
    }
    
    func pauseBackgroundMusic() {
        backgroundMusicPlayer?.pause()
    }
    
    func playGameOverMusic() {
        gameOverMusicPlayer?.play()
    }
    
    func stopGameOverMusic() {
        gameOverMusicPlayer?.stop()
    }
}
