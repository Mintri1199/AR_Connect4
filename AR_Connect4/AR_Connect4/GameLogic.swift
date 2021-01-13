//
//  GameLogic.swift
//  AR_Connect4
//
//  Created by Jackson Ho on 1/13/21.
//
// Contains the game logic for Connect 4

import Foundation

enum CellState {
    case red, blue, empty
}

// Standard board size 7 x 6

class Game {
    var board = Array(repeating: Array(repeating: CellState.empty, count: 7), count: 6)
    var winner = CellState.empty
    init() {
    }

    // Steps to play
    // 1. One player choose a col to place their cell in, the cell will always go to the bottom
    //    and stack on top of an already present cell.
    // 2. Check whether the player has won or not based on where they placed their cell.
    // 3. Repeat Step 1 for the other player.
    // 4. If neither player has won and the board has been filled up, then it forces a draw.

    
    /// Win Condition: The player wins when they achieve 4 or more consecutive cell of their own color 
    /// on the board. The directions can be vertical, horizontal, and diagonal.

    // Place the player's cell in a column of the board
    func place(column: Int, color: CellState) {
        let rowEndIndex = board.endIndex - 1

        for i in stride(from: rowEndIndex, to: 0, by: -1) {
            if board[i][column] == .empty {
                board[i][column] = color
                break
            }
        }
    }

    func checkForWin(col: Int, row: Int, count: Int=1, color: CellState, win: Bool=false) {
        // Base Case cell of current position is empty or doesn't not match the argument's color
        if board[row][col] != color {
            return 
        }

        // check for horizontal win
        if checkForHozintal(row: row, col: col, color: color) {
            winner = color
            print("\(color) win")
            return
        }

        // check for vertical win
        // check for diagonal win

        return
    }

    private func checkForHozintal(row: Int, col: Int, color: CellState) -> Bool {
        var count = 0
        var cell = board[row][col]
        var colPosition = col

        repeat {
            count += 1
            colPosition -= 1
            if colPosition < 0 {
                break
            }
            cell = board[col][colPosition - 1]
        } while cell == color && count < 4

        cell = board[row][col + 1]
        colPosition = row
        
        while cell == color && count < 4 {
            count += 1
            colPosition += 1
        }

        return count == 4
    }

    func printGameState() {
        var tempBoard: [[Int]] = []
        for row in board {
            let tempRow: [Int] = row.map { cell in 
                switch cell {
                    case .empty:
                        return 0
                    case .red: 
                        return 1
                    case .blue:
                        return 2
                }
            }
            tempBoard.append(tempRow)
        }

        tempBoard.forEach { print($0) }
         
    }

}


let game = Game()
game.place(column: 0, color: .red)
game.place(column: 0, color: .blue)
game.place(column: 1, color: .red)
game.place(column: 3, color: .red)
game.place(column: 2, color: .red)
game.printGameState()
game.checkForWin(col: 0, row: 5, color: .red)