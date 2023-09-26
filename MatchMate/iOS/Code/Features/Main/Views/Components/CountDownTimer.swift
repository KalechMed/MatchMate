//
//  Timer.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct CountDownTimer: View {
    
    // Mark: - Variables
    
    @Binding var timeRemaining: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    

    // Mark: - Views
    
   
    var body: some View {
        Text("\(timeRemaining) s")
            .font(Bobaland.Regular.font(size: 40))
                   .onReceive(timer) { _ in
                       if self.timeRemaining > 0 {
                           self.timeRemaining -= 1
                       }
                   }
    }
    func startTimer() {
           Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
               if self.timeRemaining > 0 {
                   self.timeRemaining -= 1
               } else {
                   timer.invalidate()
               }
           }
       }
    
}

#Preview {
    CountDownTimer(timeRemaining: .constant(15))
}
