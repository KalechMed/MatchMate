//
//  attemptsView.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct attemptsView: View {
    
    
    // Mark: - Variables
    
    let maxAttempts: Int = 3
    var usedAttempts: Int
    
    // Mark: - Views
    
    
    var body: some View {
        
        
        VStack()
        {
            
            Text("You have 3 attempts to match")
                .font(Bobaland.Regular.font(size:22))
                .foregroundColor(Color("GrayTxt"))
                .padding(.bottom,20)
            HStack()
            {
                Text("attempts")
                Spacer()
                
                HStack(spacing: 0){
                    Text("\(usedAttempts)")
                    Text("/3")
                }
            }
            .font(Bobaland.Regular.font(size:18))
            
            
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .frame(width: 300, height: 26)
                    .cornerRadius(20)
                    .foregroundColor(Color("lightGr"))
                
                
                Rectangle()
                    .frame(width: calculateUsedBarWidth(), height: 26)
                    .cornerRadius(20)
                    .foregroundColor(Color("lightBlue"))
                    .animation(Animation.easeInOut(duration: 1.5),value: usedAttempts)
                
                Spacer()
            }
        }
        
        
    }
    
        
        private func calculateUsedBarWidth() -> CGFloat {
            let percentage = CGFloat(usedAttempts) / CGFloat(maxAttempts)
            return percentage * 300 
        }
    
}
    
#Preview {
    attemptsView(usedAttempts: 2)
}
