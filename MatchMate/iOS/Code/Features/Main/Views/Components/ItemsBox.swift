//
//  ItemsBox.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI
import Algorithms
    

struct ItemsBox: View {
    
    @State private var box1: [String] = []
    @State private var box2: [String] = []
    @State private var box3: [String] = []
    @State private var box4: [String] = []
    @State private var box5: [String] = []
    @State private var box6: [String] = []
    @State private var box:  [String] = ["leftBear","rightBear", "leftChick","rightChick","leftFrog","rightFrog","leftKoala","rightKoala","leftMonkey","rightMonkey","leftPig","rightPig"]
    @State private var showTryAlert = false
    

    
    @ObservedObject var timerViewModel: TimerViewModel
    let randomizedList: [String] = getSavedRandomizedList() ?? []
    @State private var combinedList: [String] = []
    @State var Win = false
    @State var GameOver = false
    @State private var hasBoxChanged = true
    @State var usedAttempts : Int = 1
    @Binding var isToggled: Bool
  
    
    var body: some View {
        
        
        ZStack(alignment:Alignment(horizontal: .trailing, vertical: .top))
        {
            
            Button(action: {
                
                withAnimation {
                                isToggled.toggle()
                        }
                if isToggled {
                        
                    AudioManager.instance.stopSound()
                    
                    } else {
                        
                        
                        AudioManager.instance.playSound(sound: .Background)
                        AudioManager.instance.setVolume(0.1)
                    }
                    
            }) {
                
                Image(systemName: isToggled ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.system(size: 30))
                    
                    .foregroundColor(Color("lightBlue"))
                    .symbolEffect(.bounce , value: isToggled)
                    .contentTransition(.symbolEffect(.replace.wholeSymbol.byLayer))
                    .padding(.trailing,60)
                    .padding(.top,4)
                
                
            }
            
            
            VStack(alignment: .center)
            {
                
                VStack()
                {
                    Text("Match Mate")
                        .font(Bobaland.Regular.font(size:40))
                        .foregroundColor(Color("Title"))
                        .padding(.bottom,20)
                    
                    attemptsView(usedAttempts: usedAttempts)
                    
                    if  timerViewModel.timeRemaining == 0
                    {
                        HStack()
                        {
                            Text("Start Matching !!")
                                .font(Bobaland.Regular.font(size: 26))
                                .padding(.vertical,20)
                                
                            
                            
                            
                            Spacer()
                            
                            
                        }
                        
                        
                    }
                    else {
                        
                        HStack(alignment: .center) {
                            
                            Text("it´s counting ! Pay attention to every detail.")
                                .font(Bobaland.Regular.font(size: 16))
                            
                            Spacer()
                            CountDownTimer(timeRemaining: $timerViewModel.timeRemaining)
                            
                            
                        }
                        
                    }
                }
                .padding(.horizontal,78)
                
                    
                    
                
                
                
                VStack()
                {
                    
                    if  timerViewModel.timeRemaining > 0
                    {
                        
                        randomizedPairs()
                        
                        
                        
                         
                    }
                    else if timerViewModel.timeRemaining == 0
                    {
                        
                        BigBox(items: box)
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
                       
                    
                    
                    
                    
                   
                        
                        VStack(spacing: 20)
                        {
                            HStack() {
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
                            
                            
                            
                            
                            
                            HStack() {
                                
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
                        .padding(.vertical,20)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("Box")))
                        
                        
                    
                    
                    
                }
                
                .onAppear
                {
                        
                    
                    print("randomizedList in itemBox \(randomizedList)")
                }
                
                
                
            
            
           
            if showTryAlert {
                TryAlertView(show: $showTryAlert)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.primary.opacity(0.35))
                                .onAppear {
                                    // Start a timer to hide the alert after 5 seconds
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                        showTryAlert = false
                                    }
                                }
                        }
                
               
            
            
            
            VStack(alignment: .center) {
                
                
               
                if combinedList.elementsEqual(randomizedList) && usedAttempts <= 3 {
                    WinAlertView(usedAttempts:$usedAttempts , show: $Win)
                    
                    
                } else if box.isEmpty && usedAttempts >= 3 {
                    
                    LoseAlertView(show: $GameOver)
                }
                    
                    
                
            }
            .onAppear {
                // Initialize the combined list on appear
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                hasBoxChanged =  true
                
            }
            .onChange(of: box1, perform: { _ in
                // Update the combined list whenever there's a change in box1
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                
                
            })
            .onChange(of: box2, perform: { _ in
                // Update the combined list whenever there's a change in box2
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                
                
            })
            .onChange(of: box3, perform: { _ in
                // Update the combined list whenever there's a change in box3
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                
                
            })
            .onChange(of: box4, perform: { _ in
                // Update the combined list whenever there's a change in box4
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
               
                
            })
            .onChange(of: box5, perform: { _ in
                // Update the combined list whenever there's a change in box5
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                
                
            })
            .onChange(of: box6, perform: { _ in
                // Update the combined list whenever there's a change in box6
                combinedList = box1 + box2 + box3 + box4 + box5 + box6
                
                hasBoxChanged = true
                checkGameStatus()
                print("\(hasBoxChanged)")
                
                
            })
            
            
        }
            
            
        }
        
        .navigationBarBackButtonHidden()
        
    }
    
    func checkGameStatus() {
        
        print("\(hasBoxChanged)")
        if box.isEmpty && usedAttempts < 3 && !combinedList.elementsEqual(randomizedList) && hasBoxChanged {
            
            showTryAlert = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                
           
            timerViewModel.timeRemaining += 15
            usedAttempts += 1
            
           
            box1 = []
            box2 = []
            box3 = []
            box4 = []
            box5 = []
            box6 = []
            
            hasBoxChanged = false
           
            
           
            timerViewModel.startTimer()
            box = ["leftBear","rightBear", "leftChick","rightChick","leftFrog","rightFrog","leftKoala","rightKoala","leftMonkey","rightMonkey","leftPig","rightPig"]
            
            }
        }
    }
        
        
    
    
    
    
}

#Preview {
    ItemsBox(timerViewModel: TimerViewModel(), isToggled: .constant(true))
}

struct WhiteBox: View {
    let items: [String]

    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 80,height: 80)
                .foregroundColor(.white)

            HStack(alignment: .center, spacing: 1) {
                ForEach(items, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70)
                        .shadow(radius: 1, x: 1, y: 1)
                        .draggable(item)
                }
                
            }
            
        }
        .padding(.horizontal,14)
    }
}

struct BigBox: View {
    let items: [String]

    var body: some View {
       
            
                

            VStack(alignment: .center , spacing: 20) {
                HStack {
                    ForEach(items.prefix(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 62)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(item)
                            .fixedSize()
                        if items.firstIndex(of: item)! % 2 == 1 {
                        
                            HStack()
                             {
                         
                             }
                             .frame(width: 10)
                        }
                    }
                }
               
                
                HStack() {
                    ForEach(items.dropFirst(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 62)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(item)
                            .fixedSize()
                        if items.firstIndex(of: item)! % 2 == 1 {
                        
                            HStack()
                             {
                         
                             }
                             .frame(width: 10)
                        }
                        
                       
                    }
                }
        }
            .padding(.leading,14)
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("Box")))
    }
}


