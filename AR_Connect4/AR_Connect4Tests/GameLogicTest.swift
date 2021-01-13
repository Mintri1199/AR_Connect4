//
//  GameLogicTest.swift
//  AR_Connect4Tests
//
//  Created by Jackson Ho on 1/13/21.
//

import XCTest

@testable import AR_Connect4

class GameLogicTest: XCTestCase {
  private let gameInstance = Game()
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testPlaceMethod() {
    // Placed cell should be at the end of the column array
    gameInstance.place(column: 0, color: .red)
    
    // The other indexes should contains CellState.empty except for the last one
    for col in 1 ... 5 {
      XCTAssertEqual(gameInstance.board[5][col], CellState.empty)
    }
    // The placed cell should be at the end of the column array
    XCTAssertEqual(gameInstance.board[5][0], CellState.red)
    
    // Placed cell should be on top of another previously present cell on the same column
    gameInstance.place(column: 0, color: .blue)
    
    // The other indexes should contains CellState.empty except for the last two
    for i in 1 ... 5 {
      XCTAssertEqual(gameInstance.board[4][i], CellState.empty)
    }
    // The placed cell should be at the end of the column array
    XCTAssertEqual(gameInstance.board[4][0], CellState.blue)
  }
  
  func testHorizontalMethod() {
    // Test the method to detect horizontal win condition
    gameInstance.place(column: 0, color: .red)
    gameInstance.place(column: 1, color: .red)
    gameInstance.place(column: 3, color: .red)
    gameInstance.place(column: 2, color: .red)
    
    XCTAssertTrue(gameInstance.checkForHorizontal(row: 5, col: 1, color: .red))
    
    gameInstance.place(column: 6, color: .red)
    XCTAssertFalse(gameInstance.checkForHorizontal(row: 5, col: 6, color: .red))
  }
  
  func testVerticalMethod() {
    // Test the method to detect vertical win condition
    gameInstance.place(column: 0, color: .red)
    gameInstance.place(column: 0, color: .red)
    gameInstance.place(column: 0, color: .red)
    gameInstance.place(column: 0, color: .red)
    
    XCTAssertTrue(gameInstance.checkForVertical(row: 4, col: 0, color: .red))
    
    gameInstance.place(column: 1, color: .red)
    gameInstance.place(column: 1, color: .red)
    gameInstance.place(column: 1, color: .blue)
    gameInstance.place(column: 1, color: .red)
    gameInstance.place(column: 1, color: .red)
    XCTAssertFalse(gameInstance.checkForVertical(row: 4, col: 0, color: .blue))
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
}

