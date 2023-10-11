//
//  CardViewModel.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

class CardViewModel: ObservableObject {
     var randomizedList: [String] = []
   
    
    init() {
       
            generateRandomCardPairs()
        
    }
    
    func generateRandomCardPairs() {
        
       
        let leftsideImages = ["leftBear", "leftChick", "leftFrog", "leftKoala", "leftMonkey", "leftPig"]
        let rightsideImages = ["rightBear", "rightChick", "rightFrog", "rightKoala", "rightMonkey", "rightPig"]

        let randomizedleft = leftsideImages.shuffled()
        let randomizedright = rightsideImages.shuffled()

        
        
        for (left, right) in zip(randomizedleft, randomizedright) {
            randomizedList.append(left)
            randomizedList.append(right)
        }
        
        print("generate random card pairs in cardview model")
        saveRandomizedList(randomizedList)
       
       
    }
}
