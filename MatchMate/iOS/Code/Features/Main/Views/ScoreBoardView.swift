//
//  ScoreBoardView.swift
//  MatchMate
//
//  Created by Mohamed  on 17/10/2023.
//

import SwiftUI
import SwiftData

struct ScoreBoardView: View {
    @State var backToMenu: Bool = false
    @Binding var isToggled: Bool
    @Query() var players: [Players]
    var body: some View {
        GeometryReader { proxy in
            let _: CGFloat = proxy.size.height
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                VStack(spacing: 25) {
                    HStack(alignment: .center, spacing: 20) {
                        Image("Arrow")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                backToMenu = true
                            }
                            .navigationDestination(
                                isPresented: $backToMenu) {
                                    MenuView(isToggled: $isToggled)
                                }
                        Text("Menu")
                            .font(Bobaland.regular.font(size: 24))
                            .foregroundColor(Color("Title"))
                        Spacer()
                    }
                    .padding(.leading, 30)
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color("Box"))
                            .frame(width: 326, height: 378)
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                            Text("Highest Score :")
                                .font(Bobaland.regular.font(size: 20))
                            GifManager("Carlo")
                                .frame(width: 136, height: 136)
                            HStack {
                                if let highestScore = players.max(by: { $0.score < $1.score }) {
                                    HStack {
                                        Text("\(highestScore.score)")
                                        Text("Points")
                                    }
                                    .font(Bobaland.regular.font(size: 44))
                                    .foregroundColor(Color("Title"))
                                } else {
                                    Text("No Scores Available")
                                        .font(Bobaland.regular.font(size: 24))
                                        .foregroundColor(Color("GrayTxt"))
                                }
                            }
                            VStack {
                                if let highestScore = players.max(by: { $0.score < $1.score }) {
                                    HStack {
                                        Text("\(highestScore.attempts)")
                                        Text("Attempts")
                                    }
                                    HStack {
                                        Text("\(highestScore.gameTime)")
                                        Text("Seconds")
                                    }
                                }
                            }
                            .font(Bobaland.regular.font(size: 20))
                            .foregroundColor(Color("GrayTxt"))
                        }
                    }
                    VStack {
                        HStack {
                            Text("Other Players")
                                .font(Bobaland.regular.font(size: 20))
                                .foregroundColor(.black)
                                .padding(.leading, 40)
                            Spacer()
                        }
                        RoundedRectangle(cornerRadius: 23)
                            .foregroundColor(Color("Box"))
                            .frame(width: 326, height: 80)
                        RoundedRectangle(cornerRadius: 23)
                            .foregroundColor(Color("Box"))
                            .frame(width: 326, height: 80)
                    }
                }
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ScoreBoardView(isToggled: .constant(true))
}
