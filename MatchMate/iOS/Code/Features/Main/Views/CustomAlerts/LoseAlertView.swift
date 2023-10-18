//
//  LoseAlertView.swift
//  MatchMate
//
//  Created by Mohamed  on 9/10/2023.
//

import SwiftUI


struct LoseAlertView: View {
    
    // Mark: - Variables
    
    @Binding var show: Bool
    @State var NavigateToMenu: Bool = false
    @Binding var isToggled: Bool
    
    
    // Mark: - Views
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    HStack(spacing: 10) {
                        Text("Game Over")
                            .font(Bobaland.Regular.font(size: 40))
                            .foregroundColor(Color("Title"))
                            .padding(.trailing, 10)
                    }
                    
                    HStack(spacing: 10) {
                        GifManager("cryingCat")
                            .frame(width: 92, height: 121)
                            .padding(.trailing, 10)
                        
                        Text("Oops, You've Run Out of Attempts.")
                            .font(Bobaland.Regular.font(size: 20))
                            .foregroundColor(Color("GrayTxt"))
                            .frame(width: 106)
                     
                    }
                    
                    Button(action: {
                        NavigateToMenu = true
                    }) {
                        Text("Menu")
                            .font(Bobaland.Regular.font(size: 30))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240, height: 50)
                            .background(Color("lightBlue"))
                            .cornerRadius(16)
                    }
                    .padding(.top, 20)
                    .navigationDestination(isPresented: $NavigateToMenu) {
                        MenuView(isToggled: $isToggled)
                    }
                }
                .onAppear {
                    AudioManager.instance.playSound(sound: .GameOver)
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 30)
                .background()
                .cornerRadius(26)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primary.opacity(0.35))
        }
    }
}

#Preview {
    LoseAlertView(show: .constant(true), isToggled: .constant(true))
}
