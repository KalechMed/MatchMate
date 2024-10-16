//
//  Timer.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI
import Combine

struct CountDownTimer: View {
    @Binding var timeRemaining: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text("\(timeRemaining) s")
            .font(Bobaland.regular.font(size: 40))
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
            }
    }
}

#Preview {
    CountDownTimer(timeRemaining: .constant(15))
}
