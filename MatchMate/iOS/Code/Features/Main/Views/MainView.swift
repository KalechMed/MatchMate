//
//  MainView.swift
//  MatchMate
//
//  Created by Mohamed  on 15/10/2023.
//

import SwiftUI

struct MainView: View {
    
    // Mark: - Variables
       
       @State private var isToggled :Bool = false
       @ObservedObject var gameViewModel = GameViewModel()

           init() {
               gameViewModel.generateRandomCardPairs()
           }
       // Mark: - Views
    
    var body: some View {
        
        MenuView(isToggled: $isToggled)
        
    }
}

#Preview {
    MainView()
}
