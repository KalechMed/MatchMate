//
//  DetailsView.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct DetailsView: View {
    
    // Mark: - Variables
    @ObservedObject var viewModel: CardViewModel
    @State private var timeRemaining = 15
    
    // Mark: - Views
   
    var body: some View {
       
        
        HStack(alignment: .center,spacing: 30) {
               
                Text("It's memory time! Pay attention to every detail.")
                    .font(Bobaland.Regular.font(size: 16))
                   
                    
                    
                CountDownTimer()
               
                    .onAppear {
                        startTimer()
                    }
            }
        .padding(.horizontal,30)
        
        
        
    }
    func startTimer() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if self.timeRemaining > 0 {
                    self.timeRemaining = timeRemaining
                } else {
                    timer.invalidate()
                }
            }
        }
    
    }


#Preview {
    DetailsView(viewModel: CardViewModel())
}
