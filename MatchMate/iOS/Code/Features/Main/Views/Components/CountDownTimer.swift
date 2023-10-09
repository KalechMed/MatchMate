//
//  Timer.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI
import Combine

struct CountDownTimer: View {
    
    @Binding var timeRemaining: Int // Declare timeRemaining as a @Binding property
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(timeRemaining) s")
            .font(Bobaland.Regular.font(size: 40))
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 { // Use 'self' to access the property
                    self.timeRemaining -= 1 // Mutate the property using 'self'
                }
            }
    }
}

#Preview {
    CountDownTimer(timeRemaining: .constant(15))
    
}
