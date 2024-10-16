//
//  ItemsBox.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI
import Algorithms

struct GameView: View {
    // MARK: - Variables
    @State private var box1: [String] = []
    @State private var box2: [String] = []
    @State private var box3: [String] = []
    @State private var box4: [String] = []
    @State private var box5: [String] = []
    @State private var box6: [String] = []
    @State private var box: [String] = ["leftBear", "rightBear", "leftChick",
                                        "rightChick", "leftFrog", "rightFrog",
                                        "leftKoala", "rightKoala", "leftMonkey",
                                        "rightMonkey", "leftPig", "rightPig"]
    @State private var showTryAlert = false
    @ObservedObject var timerViewModel = TimerViewModel()
    @ObservedObject var gameViewModel = GameViewModel()
    let randomizedList: [String] = getSavedRandomizedList() ?? []
    @State private var combinedList: [String] = []
    @State var win = false
    @State var gameOver = false
    @State private var hasBoxChanged = true
    @Binding var isToggled: Bool
    @State var usedAttempts: Int = 1
    // MARK: - Views
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
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
                Image(systemName: isToggled ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color("lightBlue"))
                    .symbolEffect(.bounce, value: isToggled)
                    .contentTransition(.symbolEffect(.replace.wholeSymbol.byLayer))
                    .padding(.trailing, 60)
                    .padding(.top, 4)
            }
            VStack(alignment: .center) {
                VStack {
                    Text("Match Mate")
                        .font(Bobaland.regular.font(size: 40))
                        .foregroundColor(Color("Title"))
                        .padding(.bottom, 20)
                    AttemptsView(gameViewModel: GameViewModel(), usedAttempts: $usedAttempts)
                    if timerViewModel.timeRemaining == 0 {
                        HStack {
                            Text("Start Matching !!")
                                .font(Bobaland.regular.font(size: 26))
                                .padding(.vertical, 20)
                            Spacer()
                        }
                    }
                    else {
                        HStack(alignment: .center) {
                            Text("it´s counting ! Pay attention to every detail.")
                                .font(Bobaland.regular.font(size: 16))
                            Spacer()
                            CountDownTimer(timeRemaining: $timerViewModel.timeRemaining)
                        }
                    }
                }
                .padding(.horizontal, 78)
                VStack {
                    if  timerViewModel.timeRemaining > 0 {
                        RandomizedPairs()
                    }
                    else if timerViewModel.timeRemaining == 0 {
                        OrderedPairs(items: box)
                            .dropDestination(for: String.self) { droppedItems, location in
                                for item in droppedItems {
                                    box1.removeAll { $0 == item }
                                    box2.removeAll { $0 == item }
                                    box3.removeAll { $0 == item }
                                    box4.removeAll { $0 == item }
                                    box5.removeAll { $0 == item }
                                    box6.removeAll { $0 == item }
                                }
                                let totalItems = box + droppedItems
                                box = Array(totalItems.uniqued())
                                return true
                            }
                    }
                    VStack(spacing: 20) {
                        HStack {
                            WhiteBox(items: box1)
                                .dropDestination(for: String.self) { droppedItems, location in
                                    for item in droppedItems {
                                        box2.removeAll { $0 == item }
                                        box3.removeAll { $0 == item }
                                        box4.removeAll { $0 == item }
                                        box5.removeAll { $0 == item }
                                        box6.removeAll { $0 == item }
                                        box.removeAll { $0 == item }
                                    }
                                    let totalItems = box1 + droppedItems
                                    box1 = Array(totalItems.uniqued())
                                    return true
                                }
                            WhiteBox(items: box2)
                                .dropDestination(for: String.self) { droppedItems, location in
                                    for item in droppedItems {
                                        box1.removeAll { $0 == item }
                                        box3.removeAll { $0 == item }
                                        box4.removeAll { $0 == item }
                                        box5.removeAll { $0 == item }
                                        box6.removeAll { $0 == item }
                                        box.removeAll { $0 == item }
                                    }
                                    let totalItems = box2 + droppedItems
                                    box2 = Array(totalItems.uniqued())
                                    return true
                                }
                            WhiteBox(items: box3)
                                .dropDestination(for: String.self) { droppedItems, location in
                                    for item in droppedItems {
                                        box2.removeAll { $0 == item }
                                        box1.removeAll { $0 == item }
                                        box4.removeAll { $0 == item }
                                        box5.removeAll { $0 == item }
                                        box6.removeAll { $0 == item }
                                        box.removeAll { $0 == item }
                                    }
                                    let totalItems = box3 + droppedItems
                                    box3 = Array(totalItems.uniqued())
                                    return true
                                }
                        }
                        HStack {
                            WhiteBox(items: box4)
                                .dropDestination(for: String.self) { droppedItems, location in
                                    for item in droppedItems {
                                        box2.removeAll { $0 == item }
                                        box3.removeAll { $0 == item }
                                        box1.removeAll { $0 == item }
                                        box5.removeAll { $0 == item }
                                        box6.removeAll { $0 == item }
                                        box.removeAll { $0 == item }
                                    }
                                    let totalItems = box4 + droppedItems
                                    box4 = Array(totalItems.uniqued())
                                    return true
                                }
                            WhiteBox(items: box5)
                                .dropDestination(for: String.self) { droppedItems, location in
                                    for item in droppedItems {
                                        box2.removeAll { $0 == item }
                                        box3.removeAll { $0 == item }
                                        box4.removeAll { $0 == item }
                                        box1.removeAll { $0 == item }
                                        box6.removeAll { $0 == item }
                                        box.removeAll { $0 == item }
                                    }
                                    let totalItems = box5 + droppedItems
                                    box5 = Array(totalItems.uniqued())
                                    return true
                                }
                            WhiteBox(items: box6)
                                .dropDestination(for: String.self) { droppedItems, location in
                                    for item in droppedItems {
                                        box2.removeAll { $0 == item }
                                        box3.removeAll { $0 == item }
                                        box4.removeAll { $0 == item }
                                        box5.removeAll { $0 == item }
                                        box1.removeAll { $0 == item }
                                        box.removeAll { $0 == item }
                                    }
                                    let totalItems = box6 + droppedItems
                                    box6 = Array(totalItems.uniqued())
                                    return true
                                }
                        }
                    }
                    .padding(10)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("Box")))
                }
            }
            if showTryAlert {
                TryAlertView(show: $showTryAlert)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.primary.opacity(0.35))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            showTryAlert = false
                        }
                    }
            }
            VStack(alignment: .center) {
                if combinedList.elementsEqual(randomizedList) && gameViewModel.usedAttempts <= 3 {
                    WinAlertView(show: $win, gameTime: timerViewModel.gameTime)
                        .environmentObject(TimerViewModel())
                        .onAppear {
                            timerViewModel.stopGameTimer()
                        }
                } else if box.isEmpty && gameViewModel.usedAttempts >= 3 {
                    LoseAlertView(show: $gameOver, isToggled: $isToggled)
                }
            }
            .onAppear {
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                hasBoxChanged =  true
            }
            .onChange(of: [box1, box2, box3, box4, box5]) {
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
            }
            .onChange(of: box6) {
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                hasBoxChanged = true
                checkGameStatus()
            }
        }
        .onAppear {
            timerViewModel.startGameTimer()
        }
        .navigationBarBackButtonHidden()
    }
    func checkGameStatus() {
        if box.isEmpty && gameViewModel.usedAttempts < 3
            && !combinedList.elementsEqual(randomizedList) && hasBoxChanged {
            showTryAlert = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                timerViewModel.timeRemaining += 15
                usedAttempts += 1
                gameViewModel.usedAttempts += 1
                print("usedAttempts2 :\(gameViewModel.usedAttempts)")
                box1 = []
                box2 = []
                box3 = []
                box4 = []
                box5 = []
                box6 = []
                hasBoxChanged = false
                timerViewModel.startTimer()
                box = ["leftBear", "rightBear", "leftChick",
                       "rightChick", "leftFrog", "rightFrog",
                       "leftKoala", "rightKoala", "leftMonkey",
                       "rightMonkey", "leftPig", "rightPig"]
            }
        }
    }
}

#Preview {
    GameView(timerViewModel: TimerViewModel(), isToggled: .constant(true))
}
