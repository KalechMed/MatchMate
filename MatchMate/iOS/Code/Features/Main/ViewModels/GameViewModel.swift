//
//  GameViewModel.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    var randomizedList: [String] = []
    @Published var usedAttempts = 1
    @Published var showTryAlert = false
    func generateRandomCardPairs() {
        let leftsideImages = ["leftBear", "leftChick", "leftFrog", "leftKoala", "leftMonkey", "leftPig"]
        let rightsideImages = ["rightBear", "rightChick", "rightFrog", "rightKoala", "rightMonkey", "rightPig"]
        let randomizedleft = leftsideImages.shuffled()
        let randomizedright = rightsideImages.shuffled()

        for (left, right) in zip(randomizedleft, randomizedright) {
            randomizedList.append(left)
            randomizedList.append(right)
        }
        saveRandomizedList(randomizedList)
    }
    func calculateScore(attempts: Int, gameTime: Int) -> Int {
            let scoreReductionPerAttempt = 10
            let baseScore = 300
            let score = max(baseScore - attempts * scoreReductionPerAttempt - gameTime, 0)
            return score
    }
}
