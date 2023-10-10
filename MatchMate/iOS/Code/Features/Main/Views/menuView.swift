//
//  MenuView.swift
//  MatchMate
//
//  Created by Mohamed  on 10/10/2023.
//

import SwiftUI

struct menuView: View {
    
    @State var navigateToGame: Bool = false
    
    var body: some View {
        
        NavigationStack
        {
            
            VStack(alignment: .center)
            {
                
                Text("Match Mate")
                    .font(Bobaland.Regular.font(size:50))
                    .foregroundColor(Color("Title"))
                    .padding(.bottom,20)
                
                VStack(spacing: 30)
                {
                    
                    Button(action: {
                        navigateToGame = true
                        
                    }
                           
                    ) {
                        Text("Level 1")
                            .font(Bobaland.Regular.font(size:30))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240, height: 50)
                            .background(Color("lightBlue"))
                            .cornerRadius(16)
                    }
                    .navigationDestination(
                        isPresented: $navigateToGame) {
                            ScreenTimer()
                            
                        }
                    Button(action: {
                        
                    }
                           
                    ) {
                        Text("Level 2")
                            .font(Bobaland.Regular.font(size:30))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240, height: 50)
                            .background(Color("lightBlue"))
                            .cornerRadius(16)
                    }
                    Button(action: {
                        
                    }
                           
                    ) {
                        Text("Level 3")
                            .font(Bobaland.Regular.font(size:30))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240, height: 50)
                            .background(Color("lightBlue"))
                            .cornerRadius(16)
                    }
                }
                
            }
        }
    }
}

#Preview {
    menuView()
}
