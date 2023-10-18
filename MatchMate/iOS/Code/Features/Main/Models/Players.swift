//
//  Player.swift
//  MatchMate
//
//  Created by Mohamed  on 18/10/2023.
//

import Foundation
import SwiftData

@Model
class Players {
    
    var Score : Int
    var attempts : Int
    var gameTime : Int

    
    init(Score: Int, attempts: Int, gameTime: Int) {
        self.Score = Score
        self.attempts = attempts
        self.gameTime = gameTime
    }
}
