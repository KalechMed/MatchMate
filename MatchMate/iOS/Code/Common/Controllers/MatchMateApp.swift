//
//  MatchMateApp.swift
//  MatchMate
//
//  Created by Mohamed  on 23/9/2023.
//

import SwiftUI
import SwiftData

@main
struct MatchMateApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Players.self])
        }
    }
}
