//
//  whiteBox.swift
//  MatchMate
//
//  Created by Mohamed  on 12/10/2023.
//

import SwiftUI

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


