//
//  attemptsView.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

struct AttemptsView: View {
    // MARK: - Variables
    @ObservedObject var gameViewModel: GameViewModel
    @Binding var usedAttempts: Int
    // MARK: - Views
    var body: some View {
        VStack {
            Text("You have 3 attempts to match")
                .font(Bobaland.regular.font(size: 22))
                .foregroundColor(Color("GrayTxt"))
                .padding(.bottom, 20)
            HStack {
                Text("attempts")
                Spacer()
                HStack(spacing: 0) {
                    Text("\(usedAttempts)")
                    Text("/3")
                }
            }
            .font(Bobaland.regular.font(size: 18))
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 300, height: 26)
                    .cornerRadius(20)
                    .foregroundColor(Color("lightGr"))
                Rectangle()
                    .frame(width: calculateUsedBarWidth(), height: 26)
                    .cornerRadius(20)
                    .foregroundColor(Color("lightBlue"))
                    .animation(Animation.easeInOut(duration: 1.5), value: usedAttempts)
                Spacer()
            }
        }
    }
    func calculateUsedBarWidth() -> CGFloat {
        let maxAttempts = 3
        let percentage = CGFloat(usedAttempts) / CGFloat(maxAttempts)
        return percentage * 300
    }
}

#Preview {
    AttemptsView(gameViewModel: GameViewModel(), usedAttempts: .constant(1))
}
