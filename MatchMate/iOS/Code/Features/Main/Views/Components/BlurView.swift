//
//  BlurView.swift
//  MatchMate
//
//  Created by Mohamed  on 8/10/2023.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
   
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style:
                .systemUltraThinMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

#Preview {
    BlurView()
}
