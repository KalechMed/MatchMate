//
//  DetailsView.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct DetailsView: View {
    
    // MARK: - Variables
    
    @State private var timeRemaining = 15
    
    // MARK: - Views
   
    var body: some View {
       
        if timeRemaining == 0 {
            HStack {
                Text("Start Matching !!")
                    .font(Bobaland.Regular.font(size: 26))
                    .padding(.vertical, 20)
                    .padding(.leading, 30)
                
                Spacer()
            }
            .padding(.horizontal, 30)
        } else {
            HStack(alignment: .center) {
                Text("It's counting! Pay attention to every detail.")
                    .font(Bobaland.Regular.font(size: 16))
                
                Spacer()
                
                CountDownTimer(timeRemaining: $timeRemaining)
            }
            .padding(.horizontal, 50)
        }
    }
}

#Preview {
    DetailsView()
}

