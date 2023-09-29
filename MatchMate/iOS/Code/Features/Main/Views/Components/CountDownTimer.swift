//
//  Timer.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct CountDownTimer: View {
    
    // Mark: - Variables
    
    @State var timeRemaining: Int = 15
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
    
    
}

#Preview {
    CountDownTimer()
    
}
