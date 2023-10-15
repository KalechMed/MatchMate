//
//  GameViewModel.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    var randomizedList: [String] = []
    @Published var usedAttempts: Int = 0
    
  
    
    func generateRandomCardPairs() {
        
       
        let leftsideImages = ["leftBear", "leftChick", "leftFrog", "leftKoala", "leftMonkey", "leftPig"]
        let rightsideImages = ["rightBear", "rightChick", "rightFrog", "rightKoala", "rightMonkey", "rightPig"]

        let randomizedleft = leftsideImages.shuffled()
        let randomizedright = rightsideImages.shuffled()

        
        
        for (left, right) in zip(randomizedleft, randomizedright) {
            randomizedList.append(left)
            randomizedList.append(right)
        }
        
        print("generate random card pairs in card view model")
        saveRandomizedList(randomizedList)
       
       
    }
    
    func calculateUsedBarWidth() -> CGFloat {
            let maxAttempts = 3
            let percentage = CGFloat(usedAttempts) / CGFloat(maxAttempts)
            return percentage * 300
        }
    
    
}
