//
//  FontManager.swift
//  MatchMate
//
//  Created by Mohamed  on 24/9/2023.
//

import SwiftUI

enum Bobaland {
    case regular
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("Bobaland", size: size)
        }
    }
}
