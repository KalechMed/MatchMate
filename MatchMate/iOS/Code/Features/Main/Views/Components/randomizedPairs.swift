//
//  randomizedPairs.swift
//  MatchMate
//
//  Created by Mohamed  on 2/10/2023.
//

import SwiftUI



struct randomizedPairs: View {
    
    // Mark: - Variables
    
    let randomizedList: [String] = getSavedRandomizedList() ?? []
        
    
    // Mark: - Views
    
    
    
    
    var body: some View {
        
        
            VStack(alignment: .center,spacing: 20) {
                HStack {
                    ForEach(randomizedList.prefix(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 62)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .fixedSize()
                        if randomizedList.firstIndex(of: item)! % 2 == 1 {
                           HStack()
                            {
                        
                            }
                            .frame(width: 10)
                        }
                    }
                }
                
                
                HStack() {
                    ForEach(randomizedList.dropFirst(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 62)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .fixedSize()
                        
                        if randomizedList.firstIndex(of: item)! % 2 == 1 {
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
            .onAppear
        {
            print(" salemou aalaykom \(randomizedList)")
        }
            
        
        
        
        
    }
}


#Preview {
    randomizedPairs()
}
