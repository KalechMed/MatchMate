//
//  CardViewModel.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

class CardViewModel: ObservableObject {
    @Published var cardPairs: [Card] = []
    
  
    init() {
        generateRandomCardPairs()
    }
    
   
    func generateRandomCardPairs() {
        let leftSideImages: [Image] = [
            Image("leftBear"),
            Image("leftChick"),
            Image("leftFrog"),
            Image("leftkoala"),
            Image("leftMonkey"),
            Image("leftPig")
        ]
        let rightSideImages: [Image] = [
            Image("rightBear"),
            Image("rightChick"),
            Image("rightFrog"),
            Image("rightkoala"),
            Image("rightMonkey"),
            Image("rightPig")
        ]
        
        var pairs: [Card] = []
        
        for i in 0..<leftSideImages.count {
            let leftImage = leftSideImages[i]
            let rightImage = rightSideImages[i]
            let card = Card(leftSideImage: leftImage, rightSideImage: rightImage)
            pairs.append(card)
        }
        
        pairs += pairs
        pairs.shuffle()
        cardPairs = pairs
    }
    
    
}
