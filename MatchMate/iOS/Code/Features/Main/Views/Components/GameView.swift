//
//  GameView.swift
//  MatchMate
//
//  Created by Mohamed  on 28/9/2023.
//

import SwiftUI

struct GameView: View {
    
    // Mark: - Variables
    
    
    // Mark: - Views
    
    var body: some View {
        VStack(alignment: .center)
        {
            
            Text("Match Mate")
                .font(Bobaland.Regular.font(size:40))
                .foregroundColor(Color("Title"))
                .padding(.bottom,20)
            
            attemptsView(usedAttempts: 1)
            
            DetailsView(viewModel: CardViewModel())
                .padding(10)
            
    
            ItemsBox()
            
            
            
        }
    }
}

#Preview {
    GameView()
}
