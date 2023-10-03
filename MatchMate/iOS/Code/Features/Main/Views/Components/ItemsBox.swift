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
    
    @ObservedObject var timerViewModel: TimerViewModel
   

    var body: some View {
        
        
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
            
            
            
            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("Box"))
                    .padding(.horizontal,20)
                    .padding(.top,10)
                
                VStack()
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
                    }

                    HStack() {
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
                    }

                    
                    
                    HStack() {
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
                
                
            }
        }
    }
}

#Preview {
    ItemsBox(timerViewModel: TimerViewModel())
}

struct WhiteBox: View {
    let items: [String]

    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 60,height: 60)
                .foregroundColor(.white)

            HStack(alignment: .center, spacing: 1) {
                ForEach(items, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 54)
                        .shadow(radius: 1, x: 1, y: 1)
                        .draggable(item)
                }
                
            }
            
        }
        .padding(.horizontal,30)
    }
}

struct BigBox: View {
    let items: [String]

    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 200)
                .foregroundColor(Color("Box"))
                .padding(.horizontal,30)

            VStack() {
                HStack {
                    ForEach(items.prefix(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 52)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(item)
                            .fixedSize()
                        if items.firstIndex(of: item)! % 2 == 1 {
                        Spacer(minLength: 20)
                        }
                    }
                }
                .padding(.horizontal,90)
                
                HStack() {
                    ForEach(items.dropFirst(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 52)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(item)
                            .fixedSize()
                        
                        if items.firstIndex(of: item)! % 2 == 1 {
                        Spacer(minLength: 4)
                        }
                    }
                }
                .padding(.horizontal,90)
            }
            
        }
    }
}


