//
//  randomizedPairs.swift
//  MatchMate
//
//  Created by Mohamed  on 2/10/2023.
//

import SwiftUI

struct RandomizedPairs: View {
    // MARK: - Variables
    let randomizedList: [String] = getSavedRandomizedList() ?? []
    // MARK: - Views
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Box"))
                .frame(width: 360, height: 200)
            VStack(alignment: .center, spacing: 20) {
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
                            Spacer()
                                .frame(width: 10)
                        }
                    }
                }
                HStack {
                    ForEach(randomizedList.dropFirst(6), id: \.self) { item in
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 62)
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .fixedSize()
                        if randomizedList.firstIndex(of: item)! % 2 == 1 {
                            Spacer()
                                .frame(width: 10)
                        }
                    }
                }
            }
            .padding(.leading, 14)
            .padding(30)
        }
    }
}

#Preview {
    RandomizedPairs()
}
