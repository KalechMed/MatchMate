//
//  CustomAlertView.swift
//  MatchMate
//
//  Created by Mohamed  on 7/10/2023.
//

import SwiftUI
import SwiftData

struct WinAlertView: View {
    // MARK: - Variables
    @State var navigateToMenu: Bool = false
    @Binding var show: Bool
    @State var isToggled: Bool = false
    @EnvironmentObject var timerViewModel: TimerViewModel
    @ObservedObject var gameViewModel = GameViewModel()
    var gameTime: Int
    @Environment(\.modelContext) var context
    // MARK: - Views
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    HStack(spacing: 10) {
                        Text("You Won")
                            .font(Bobaland.regular.font(size: 40))
                            .foregroundColor(Color("Title"))
                            .padding(.trailing, 10)
                        Image("trophy")
                            .resizable()
                            .frame(width: 40, height: 38)
                    }
                    HStack {
                        GifManager("Cat")
                            .frame(width: 92, height: 121)
                            .padding(.trailing, 10)
                        VStack {
                            HStack {
                                Image("attempts")
                                    .resizable()
                                    .frame(width: 24, height: 26)
                                    .padding(.trailing, 10)
                                Text("\(gameViewModel.usedAttempts)")
                                    .font(Bobaland.regular.font(size: 30))
                                    .foregroundColor(Color("GrayTxt"))
                                Text("Attempts")
                                    .font(Bobaland.regular.font(size: 20))
                                    .foregroundColor(Color("GrayTxt"))
                            }
                            HStack {
                                Image("seconds")
                                    .resizable()
                                    .frame(width: 24, height: 26)
                                    .padding(.trailing, 10)
                                Text("\(gameTime)")
                                    .font(Bobaland.regular.font(size: 30))
                                    .foregroundColor(Color("GrayTxt"))
                                Text("Seconds  ")
                                    .font(Bobaland.regular.font(size: 20))
                                    .foregroundColor(Color("GrayTxt"))
                            }
                        }
                    }
                    Button(action: {
                        navigateToMenu = true
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
                    .padding(.top, 20)
                    .navigationDestination(
                        isPresented: $navigateToMenu) {
                            MenuView(  isToggled: $isToggled)
                        }
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 30)
                .background()
                .cornerRadius(26)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.35))
            .onAppear {
                let score = gameViewModel.calculateScore(attempts: gameViewModel.usedAttempts, gameTime: gameTime)
                let player = Players(score: score, attempts: gameViewModel.usedAttempts, gameTime: gameTime)
                context.insert(player)
            }
        }
    }
}

#Preview {
    WinAlertView(show: .constant(true), gameTime: 10)
        .environmentObject(TimerViewModel())
}
