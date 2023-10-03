//
//  TimerViewModel.swift
//  MatchMate
//
//  Created by Mohamed  on 3/10/2023.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var timeRemaining: Int = 15
    
    private var timer: Timer?

    init() {
        startTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
}
