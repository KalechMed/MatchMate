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
    @State var navigateToGame: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var isToggled: Bool
   
    
    
    // Mark: - Views
    var body: some View {
        NavigationStack {
            VStack {
                Text("Memory time! starting in")
                    .font(Bobaland.Regular.font(size: 30))
                Text("\(timeRemaining)")
                    .font(Bobaland.Regular.font(size: 200))
                
            }
           
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                    self.isTimerActive = true
                    
                } else if self.timeRemaining == 0 {
                    self.isTimerActive = false
                    self.navigateToGame = true
                    
                }
            }
            .navigationDestination(
                     isPresented: $navigateToGame) {
                         GameView(timerViewModel: TimerViewModel(), isToggled: $isToggled )
                          
            }
            
            
           
        }
        .navigationBarBackButtonHidden()
        
        
    }
        
    
}



#Preview {
    ScreenTimer(isToggled: .constant(false))
}
