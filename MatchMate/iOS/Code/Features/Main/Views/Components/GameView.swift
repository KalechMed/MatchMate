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
        NavigationStack{
            
            ZStack()
            {
                VStack(alignment: .center)
                {
                    
                    Text("Match Mate")
                        .font(Bobaland.Regular.font(size:40))
                        .foregroundColor(Color("Title"))
                        .padding(.bottom,20)
                    
                    attemptsView(usedAttempts: 1)
                    
                    DetailsView()
                        .padding(10)
                    
                    
                    ItemsBox(timerViewModel: TimerViewModel())
                    
                    
                    
                }
                
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    
        
}

#Preview {
    GameView()
}
