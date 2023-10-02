//
//  DetailsView.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct DetailsView: View {
    
    // Mark: - Variables
    
    @State private var timeRemaining = 15
    
    // Mark: - Views
   
    var body: some View {
       
        if  timeRemaining == 0
        {
            HStack()
            {
            Text("Start Matching !!")
                .font(Bobaland.Regular.font(size: 20))
                
            Spacer()
                
            Image("start")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal,40)
                       
        }
        else {
            
            HStack(alignment: .center,spacing: 30) {
                   
                    Text("it´s counting ! Pay attention to every detail.")
                        .font(Bobaland.Regular.font(size: 16))
                        
                CountDownTimer(timeRemaining: $timeRemaining)
                   
                       
                }
            .padding(.horizontal,30)
        }
        
        
        
        
    }
    
    
    }


#Preview {
    DetailsView()
}
