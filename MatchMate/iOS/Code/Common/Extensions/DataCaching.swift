//
//  DataCaching.swift
//  MatchMate
//
//  Created by Mohamed  on 3/10/2023.
//

import SwiftUI

func saveRandomizedList(_ randomizedList: [String]) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(randomizedList, forKey: "RandomizedListKey")
}

func getSavedRandomizedList() -> [String]? {
    let userDefaults = UserDefaults.standard
    if let savedRandomizedList = userDefaults.array(forKey: "RandomizedListKey") as? [String] {
        return savedRandomizedList
    }
    return nil
}
