//
//  RandomizingTests.swift
//  MatchMateTests
//
//  Created by Mohamed  on 24/9/2023.
//

import XCTest
import SwiftUI
@testable import MatchMate

class CalculateScoreTests: XCTestCase {
    func testSuccessfulCalculation() {
        // Given informations
        let attempts = 3
        let gameTime = 80
        let calculation = GameViewModel()
        // when (act)
        let score = calculation.calculateScore(attempts: attempts, gameTime: gameTime)
        // then (assert)
        XCTAssertEqual(score, 190)
    }
    func testlongtimeCalculation() {
        // Given informations
        let attempts = 3
        let gameTime = 3000
        let calculation = GameViewModel()
        // when (act)
        let score = calculation.calculateScore(attempts: attempts, gameTime: gameTime)
        // then (assert)
        XCTAssertEqual(score, 0)
    }
}
