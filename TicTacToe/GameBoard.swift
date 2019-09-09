//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Fernando Serrano on 9/7/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import Foundation

final class GameBoard {
    var tiles: [String] = ["", "", "",
                           "", "", "",
                           "", "", ""]
    
    static let sharedInstance = GameBoard()
    
    func boardUpdate(tile: Int, type: String) -> Bool {
        if tiles[tile].isEmpty {
            tiles[tile] = type
            return true
        } else {
            return false
        }
    }
    
    func boardReset() -> Void {
        for n in 0...tiles.count-1 {
            tiles[n] = ""
        }
    }
    
    func gameOver() -> Bool {
        for n in 0...tiles.count-1 {
            if tiles[n] == "" {
                return false
            }
        }
        return true
    }
    
    func winner(type: String) -> Bool {
        if tiles[0] == tiles[1] && tiles[1] == tiles[2] && tiles[2] == type {
            return true
        } else if tiles[3] == tiles[4] && tiles[4] == tiles[5] && tiles[5] == type {
            return true
        } else if tiles[6] == tiles[7] && tiles[7] == tiles[8] && tiles[8] == type {
            return true
        } else if tiles[0] == tiles[3] && tiles[3] == tiles[6] && tiles[6] == type {
            return true
        }  else if tiles[1] == tiles[4] && tiles[4] == tiles[7] && tiles[7] == type {
            return true
        }  else if tiles[2] == tiles[5] && tiles[5] == tiles[8] && tiles[8] == type {
            return true
        }  else if tiles[0] == tiles[4] && tiles[4] == tiles[8] && tiles[8] == type {
            return true
        }  else if tiles[2] == tiles[4] && tiles[4] == tiles[6] && tiles[6] == type {
            return true
        } else {
            return false
        }
    }
}
