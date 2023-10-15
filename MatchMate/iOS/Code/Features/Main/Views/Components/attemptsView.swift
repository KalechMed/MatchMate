//
//  attemptsView.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct attemptsView: View {
    
    
    // Mark: - Variables
    
    @ObservedObject var gameViewModel: GameViewModel
    
    // Mark: - Views
    
    
    var body: some View {
        
        VStack() {
                    Text("You have 3 attempts to match")
                        .font(Bobaland.Regular.font(size: 22))
                        .foregroundColor(Color("GrayTxt"))
                        .padding(.bottom, 20)
                    HStack() {
                        Text("attempts")
                        Spacer()

                        HStack(spacing: 0) {
                            Text("\(gameViewModel.usedAttempts)")
                            Text("/3")
                        }
                    }
                    .font(Bobaland.Regular.font(size: 18))

                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: 300, height: 26)
                            .cornerRadius(20)
                            .foregroundColor(Color("lightGr"))

                        Rectangle()
                            .frame(width: gameViewModel.calculateUsedBarWidth(), height: 26)
                            .cornerRadius(20)
                            .foregroundColor(Color("lightBlue"))
                            .animation(Animation.easeInOut(duration: 1.5),value: gameViewModel.usedAttempts)

                        Spacer()
                    }
                }
    }
    
}
    
#Preview {
    attemptsView(gameViewModel: GameViewModel())
}
