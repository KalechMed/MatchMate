//
//  randomizedPairs.swift
//  MatchMate
//
//  Created by Mohamed  on 2/10/2023.
//

import SwiftUI



struct randomizedPairs: View {
    
    // Mark: - Variables
    @StateObject private var viewModel = CardViewModel()
    
    
    // Mark: - Views
    
    
    var body: some View {
        
        ZStack() {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 200)
                .foregroundColor(Color("Box"))
                .padding(.horizontal,30)

            VStack() {
                HStack {
                    ForEach(viewModel.randomizedList.prefix(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 52)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(item)
                            .fixedSize()
                        if viewModel.randomizedList.firstIndex(of: item)! % 2 == 1 {
                        Spacer(minLength: 20)
                        }
                    }
                }
                .padding(.horizontal,90)
                
                HStack() {
                    ForEach(viewModel.randomizedList.dropFirst(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 52)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(item)
                            .fixedSize()
                        
                        if viewModel.randomizedList.firstIndex(of: item)! % 2 == 1 {
                        Spacer(minLength: 4)
                        }
                    }
                }
                .padding(.horizontal,90)
            }
            
        }
        .onAppear{
            viewModel.generateRandomCardPairs()
            print(" in view \(viewModel.randomizedList)")
        }
        
        
    }
}


#Preview {
    randomizedPairs()
}
