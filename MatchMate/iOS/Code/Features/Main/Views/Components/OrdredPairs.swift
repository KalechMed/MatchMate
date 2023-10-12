//
//  OrdredPairs.swift
//  MatchMate
//
//  Created by Mohamed  on 12/10/2023.
//

import SwiftUI

struct OrdredPairs: View {
    let items: [String]

    var body: some View {
       
            
                
        ZStack()
        {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Box"))
                .frame(width: 360 ,height: 200)
            
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
            
        }
    }
}
