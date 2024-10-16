//
//  MenuView.swift
//  MatchMate
//
//  Created by Mohamed  on 10/10/2023.
//

import SwiftUI

struct MenuView: View {
    // MARK: - Variables
    @State var navigateToGame: Bool = false
    @State var navigateToStats: Bool = false
    @Binding var isToggled: Bool
    @ObservedObject var gameViewModel = GameViewModel()
    // MARK: - Views
    var body: some View {
        NavigationStack {
            ZStack(alignment:Alignment(horizontal: .center, vertical: .center)) {
                GifManager("BackgroundMenu")
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                VStack(alignment: .center)
                {
                    Text("Match Mate")
                        .font(Bobaland.regular.font(size: 50))
                        .foregroundColor(Color("Title"))
                        .padding(.top, 90)
                    Spacer()
                    VStack(spacing: 40) {
                        Button(action: {
                            navigateToGame = true
                        }
                        ) {
                            Text("Level 1")
                                .font(Bobaland.regular.font(size: 30))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 240, height: 50)
                                .background(Color("lightBlue"))
                                .cornerRadius(16)
                        }
                        .navigationDestination(
                            isPresented: $navigateToGame) {
                                ScreenTimer(isToggled: $isToggled)
                            }
                        Button(action: {
                        }
                        ) {
                            Text("Level 2")
                                .font(Bobaland.regular.font(size: 30))
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
                                .font(Bobaland.regular.font(size: 30))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 240, height: 50)
                                .background(Color("lightBlue"))
                                .cornerRadius(16)
                        }
                    }
                    Spacer()
                    HStack(spacing: 30) {
                        Button(action: {
                        }) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("lightBlue"))
                                .frame(width: 60, height: 60)
                                .overlay(Image("settings"))
                        }
                        Button(action: {
                            navigateToStats = true
                        }) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("lightBlue"))
                                .frame(width: 60, height: 60)
                                .overlay(Image("ranking"))
                        }
                        .navigationDestination(
                            isPresented: $navigateToStats) {
                                ScoreBoardView(isToggled: $isToggled)
                            }
                        Button(action: {
                            withAnimation {
                                isToggled.toggle()
                            }
                            if isToggled {
                                AudioManager.instance.stopSound()
                            } else {
                                AudioManager.instance.playSound(sound: .background)
                                AudioManager.instance.setVolume(0.1)
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("lightBlue"))
                                .frame(width: 60, height: 60)
                                .overlay(Image(systemName: isToggled ? "speaker.slash.fill" : "speaker.wave.2.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .symbolEffect(.bounce, value: isToggled)
                                    .contentTransition(.symbolEffect(.replace.wholeSymbol.byLayer)))
                        }
                    }
                    .padding(.bottom, 90)
                }
            }
            .onAppear {
                gameViewModel.generateRandomCardPairs()
                AudioManager.instance.playSound(sound: .background)
                AudioManager.instance.setVolume(0.1)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
#Preview {
    MenuView(isToggled: .constant(true))
}
