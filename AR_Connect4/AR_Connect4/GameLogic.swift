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
    var board = Array(repeating: Array(repeating: CellState.empty, count: 6), count: 7)

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
        var colArray = board[column]
        let colEndIndex = colArray.endIndex - 1

        for i in stride(from: colEndIndex, to: -1, by: -1) {
            print(colArray[i])
            if colArray[i] == .empty {
                board[column][i] = color
                print(board[column][i])
                break
            }   
        }
    }



}

let game = Game()
game.place(column: 0, color: .red)
game.place(column: 0, color: .blue)
print(game.board[0])