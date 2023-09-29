//
//  ScreenTimer.swift
//  MatchMate
//
//  Created by Mohamed  on 28/9/2023.
//

import SwiftUI

struct ScreenTimer: View {
    
    // Mark: - Variables
    @State var isTimerActive: Bool = true
    @State var timeRemaining: Int = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    // Mark: - Views
    var body: some View {
        NavigationView {
            Text("\(timeRemaining)")
                .font(Bobaland.Regular.font(size: 200))
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else if self.isTimerActive {
                        self.isTimerActive = false
                        
                        
                    }
                    print("timeRemaining: \(self.timeRemaining), isTimerActive: \(self.isTimerActive)")
                    
                    
                }
            
            
           
            
        }
        
        
    }
}



#Preview {
    ScreenTimer()
}
