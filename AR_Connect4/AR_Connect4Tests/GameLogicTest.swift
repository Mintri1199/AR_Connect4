//
//  GameLogicTest.swift
//  AR_Connect4Tests
//
//  Created by Jackson Ho on 1/13/21.
//

import XCTest

@testable import AR_Connect4

class GameLogicTest: XCTestCase {
    let gameInstance = Game()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlaceMethod() {
        // Placed cell should be at the end of the column array
        gameInstance.place(column: 0, color: .red)
        let endIndex = gameInstance.board[0].count

        // The other indexes should contains CellState.empty except for the last one
        for i in 0 ..< endIndex - 1 {
            XCTAssertEqual(gameInstance.board[0][i], CellState.empty)
        }
        // The placed cell should be at the end of the column array
        XCTAssertEqual(gameInstance.board[0][endIndex - 1], CellState.red)

        // Placed cell should be on top of another previously present cell on the same column
        gameInstance.place(column: 0, color: .blue)

        // The other indexes should contains CellState.empty except for the last two
        for i in 0 ..< endIndex - 2 {
          XCTAssertEqual(gameInstance.board[0][i], CellState.empty)
        }
        // The placed cell should be at the end of the column array
        XCTAssertEqual(gameInstance.board[0][endIndex - 2], CellState.blue)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

