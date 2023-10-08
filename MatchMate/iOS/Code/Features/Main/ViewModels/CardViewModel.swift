//
//  CardViewModel.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

class CardViewModel: ObservableObject {
    @Published var randomizedList: [String] = []
    
    
    init() {
        generateRandomCardPairs()
    }
    
    func generateRandomCardPairs() {
        let leftsideImages = ["leftBear", "leftChick", "leftFrog", "leftKoala", "leftMonkey", "leftPig"]
        let rightsideImages = ["rightBear", "rightChick", "rightFrog", "rightKoala", "rightMonkey", "rightPig"]

        let randomizedleft = leftsideImages.shuffled()
        let randomizedright = rightsideImages.shuffled()

        randomizedList = []
        
        for (left, right) in zip(randomizedleft, randomizedright) {
            randomizedList.append(left)
            randomizedList.append(right)
        }
        
        saveRandomizedList(randomizedList)
       
    }
}
