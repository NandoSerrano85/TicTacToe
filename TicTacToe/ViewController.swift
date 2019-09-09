//
//  ViewController.swift
//  TicTacToe
//
//  Created by Fernando Serrano on 9/7/19.
//  Copyright © 2019 FIU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBoard: UIImageView!
    @IBOutlet weak var turnDecorator: UILabel!
    @IBOutlet weak var banner: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var resetButton: UIButton!
    
    var playsCount: Int = 0
    var type: String = "X"
    var GB = GameBoard.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func stopButtons() {
        for n in 0...buttonCollection.count-1 {
            buttonCollection[n].isEnabled = false
            buttonCollection[n].alpha = 0.35
        }
    }
    
    func startButtons() {
        for n in 0...buttonCollection.count-1 {
            buttonCollection[n].isEnabled = true
            buttonCollection[n].alpha = 1.0
        }
    }

    @IBAction func gameButtonPressed(_ sender: UIButton) {
        var done = false
        let event: Bool = GB.boardUpdate(tile: sender.tag-1, type: type)
        if event {
            playsCount += 1
            if playsCount > 3 {
                if GB.winner(type: type) {
                    stopButtons()
                    banner.text = "Congratulations " + playerLabel.text! + " wins!"
                    playerLabel.alpha = 0.35
                    turnDecorator.alpha = 0.35
                    imgBoard.alpha = 0.35
                    done = true
                } else if GB.gameOver() {
                    stopButtons()
                    banner.text = "It's a Tie"
                    playerLabel.alpha = 0.35
                    turnDecorator.alpha = 0.35
                    imgBoard.alpha = 0.35
                    done = true
                }
            }
            if type == "X" {
                sender.setTitle(type, for: .normal)
                type = "O"
                if !done {
                    playerLabel.text = "Player 2"
                }
            } else {
                sender.setTitle(type, for: .normal)
                type = "X"
                if !done {
                    playerLabel.text = "Player 1"
                }
            }
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        startButtons()
        for n in 0...buttonCollection.count-1{
            self.buttonCollection[n].setTitle("", for: .normal)
        }
        playerLabel.text = "Player 1"
        playerLabel.alpha = 1
        turnDecorator.alpha = 1
        imgBoard.alpha = 1
        type = "X"
        banner.text = ""
        GB.boardReset()
    }
    
}

