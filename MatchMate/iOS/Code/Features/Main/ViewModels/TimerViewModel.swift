//
//  TimerViewModel.swift
//  MatchMate
//
//  Created by Mohamed  on 3/10/2023.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var timeRemaining: Int = 15
    private var timer: Timer?
    @Published var gameTime: Int = 0
    
    private var gameTimer: Timer?
    private var isPaused = false

    init() {
        startTimer()
    }

     func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
    
    func startGameTimer() {
        
        if !isPaused {
                gameTime = 0
            }
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.gameTime >= 0 &&  !self.isPaused
             {
                self.gameTime += 1
                print("Timer fired. Current gameTime: \(self.gameTime)")
            } 
        }
        print("Game timer started.")
    }
    
    
        
        
    func stopGameTimer() {
        print("game time \(gameTime)")
           isPaused = true
       }
    
    
   
}
