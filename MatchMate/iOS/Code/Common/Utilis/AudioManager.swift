//
//  MusicManager.swift
//  MatchMate
//
//  Created by Mohamed  on 10/10/2023.
//


import AVFoundation

class AudioManager  {
    
    static let instance = AudioManager()
    private var player: AVAudioPlayer?
       
    
    enum SoundOption : String
    {
        case Background
        case GameOver
    }
     
       
       func playSound(sound: SoundOption) {
           
           
           guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3")
            else
           {
               return
           }
           
           do
           {
               player?.stop()
               player = try AVAudioPlayer(contentsOf: url)
               player?.numberOfLoops = -1
               
               player?.play()
                   print("sound lanched")
               } catch {
                   print("Error loading audio: \(error.localizedDescription)")
               }
           
       }
    
    
    func stopSound()
    {
        player?.stop()
    }
    
    func setVolume(_ volume: Float) {
            player?.volume = volume
        }
    
}
