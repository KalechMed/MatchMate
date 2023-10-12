//
//  ContentView.swift
//  MatchMate
//
//  Created by Mohamed  on 23/9/2023.
//

import SwiftUI


struct MainView: View {
    
    // Mark: - Variables
    
    @State private var isToggled :Bool = false
    @ObservedObject var cardViewModel = CardViewModel()

        init() {
            cardViewModel.generateRandomCardPairs()
        }
    // Mark: - Views
    
    var body: some View {
        
        
        NavigationView
        {
            menuView(isToggled: $isToggled)
            
            
        }
    }
        
       
    
}
        

#Preview {
    MainView()
}
