//
//  RandomizingTests.swift
//  MatchMateTests
//
//  Created by Mohamed  on 24/9/2023.
//

import XCTest
import SwiftUI
@testable import MatchMate

class RandomizingTests: XCTestCase {

    var viewModel: CardViewModel!
        
        override func setUp() {
            super.setUp()
            viewModel = CardViewModel()
        }
        
        override func tearDown() {
            viewModel = nil
            super.tearDown()
        }
        
        func testGenerateRandomCardPairs_Count() {
            
            XCTAssertEqual(viewModel.cardPairs.count, 12)
        }
        
        

}
