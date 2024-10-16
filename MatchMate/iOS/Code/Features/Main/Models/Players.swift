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
    var score: Int
    var attempts: Int
    var gameTime: Int
    init(score: Int, attempts: Int, gameTime: Int) {
        self.score = score
        self.attempts = attempts
        self.gameTime = gameTime
    }
}
