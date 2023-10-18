//
//  TryAlertView.swift
//  MatchMate
//
//  Created by Mohamed  on 10/10/2023.
//

import SwiftUI

struct TryAlertView: View {
    
    // Mark: - Variables
    
    @Binding var show: Bool
    
    // Mark: - Views
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(alignment: .center, spacing: 48) {
                GifManager("try")
                    .frame(width: 160, height: 160)
                
                VStack(spacing: 20) {
                    Text("Close, but Not Quite")
                        .font(Bobaland.Regular.font(size: 28))
                        .foregroundColor(.black)
                    
                    Text("Don't worry you got other attempts")
                        .font(Bobaland.Regular.font(size: 20))
                        .foregroundColor(Color("GrayTxt"))
                        .frame(maxWidth: 300)
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background()
            .cornerRadius(26)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary.opacity(0.35))
    }
}

#Preview {
    TryAlertView(show: .constant(true))
}
