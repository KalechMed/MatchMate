//
//  LoseAlertView.swift
//  MatchMate
//
//  Created by Mohamed  on 9/10/2023.
//

import SwiftUI

struct LoseAlertView: View {
    // MARK: - Variables
    @Binding var show: Bool
    @State var navigateToMenu: Bool = false
    @Binding var isToggled: Bool
    // MARK: - Views
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    HStack(spacing: 10) {
                        Text("Game Over")
                            .font(Bobaland.regular.font(size: 40))
                            .foregroundColor(Color("Title"))
                            .padding(.trailing, 10)
                    }
                    HStack(spacing: 10) {
                        GifManager("cryingCat")
                            .frame(width: 92, height: 121)
                            .padding(.trailing, 10)
                        Text("Oops, You've Run Out of Attempts.")
                            .font(Bobaland.regular.font(size: 20))
                            .foregroundColor(Color("GrayTxt"))
                            .frame(width: 106)
                    }
                    Button(action: {
                        navigateToMenu = true
                    }) {
                        Text("Menu")
                            .font(Bobaland.regular.font(size: 30))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240, height: 50)
                            .background(Color("lightBlue"))
                            .cornerRadius(16)
                    }
                    .padding(.top, 20)
                    .navigationDestination(isPresented: $navigateToMenu) {
                        MenuView(isToggled: $isToggled)
                    }
                }
                .onAppear {
                    AudioManager.instance.playSound(sound: .gameOver)
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
