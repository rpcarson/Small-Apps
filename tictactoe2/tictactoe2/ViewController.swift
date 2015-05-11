//
//  ViewController.swift
//  tictactoe2
//
//  Created by Reed Carson on 5/8/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    
    @IBOutlet weak var playerIndicator: UILabel!
        
   
    @IBOutlet weak var playAgain: UILabel!
   
    
    @IBOutlet weak var displayWinner: UILabel!
    
    var winnerIsFound: Bool = false
    

    
    
    var spaces: [[Player?]] = [
    
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
    
    ]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playAgain.hidden = true
    }


    var currentPlayer: Player = .One
    
    
    @IBAction func buttonPressed(sender: ticbutton) {
        
 
        
        
        
        
        
        
        
        if winnerIsFound == false {
        
            if sender.player != nil { return }
            
            sender.player = currentPlayer
            sender.setNeedsDisplay()
            spaces [sender.row ] [sender.col] = currentPlayer
            
            println(spaces)
            
            checkForWinner()
            
            if currentPlayer == .One {
                
                playerIndicator.text = "Green Players's Turn!"
                
                playerIndicator.textColor = UIColor.greenColor()
                
                
            } else {
        
                playerIndicator.text = "Orange Player's Turn!"
                
                playerIndicator.textColor = UIColor.orangeColor()
                
                
            
            }
            
        
    //        if currentPlayer == .One {
    //            
    //            currentPlayer = .Two
    //            
    //        } else {
    //            
    //            currentPlayer = .One
    //        }

            
    //        line below is equal to lines above
            
            
            currentPlayer = (currentPlayer == .One) ? .Two : .One
        
        } else {
            println("Sorry but we already have a winner")
            
            
            
            
        }
    }
    
    var possibilities = [
        [0,0,0,1,0,2],
        [1,0,1,1,1,2],
        [2,0,2,1,2,2],
        [0,0,1,0,2,0],
        [0,1,1,1,2,1],
        [0,2,1,2,2,2],
        [0,0,1,1,2,2],
        [2,0,1,1,0,2],
        
    ]
    
    func checkForWinner() {
        
        
        for possibility in possibilities {
            
            
            let firstSpot = spaces[possibility[0]][possibility[1]]
            let secondSpot = spaces[possibility[2]][possibility[3]]
            let thirdSpot = spaces[possibility[4]][possibility[5]]
        
     
            if firstSpot == secondSpot && secondSpot == thirdSpot {
                
                if let winner = firstSpot {
                    
                    println("player \(winner.hashValue + 1) wins")
            
                    displayWinner.text = "player \(winner.hashValue + 1) wins"
                    
                    endGame()
                    
                    playAgain.hidden = false
                    
                    
                }

            }

            
        }

        
    
        
//        var player1Win = spaces[0][0] == spaces[0][1] && spaces[0][1] == spaces[0][2] && spaces[0][0] == .One
//        var player2Win = spaces[0][0] == spaces[0][1] && spaces[0][1] == spaces[0][2] && spaces[0][0] == .Two
        
//        var isWinner = spaces[0][0] == spaces[0][1] && spaces[0][1] == spaces[0][2]
        
//        if isWinner {
//            
//           let winner = spaces[0][0]
//            
//            
//            println("player \(winner!.hashValue + 1) wins")
//        
//        
//        }
        
        
//        if player1Win {
//            
//            println("Player 1 Wins")
//            println("Player 2 got CGrekt")
//        }
        
    }
    
    
    func endGame() {
        
        winnerIsFound = true
        
        playerIndicator.hidden = true
        
       
    }
    
    
    

    
    @IBAction func reStart(sender: UIButton) {
        
        
        println("wtf how do i reset game")
        loadView()
        playAgain.hidden = true
        
        winnerIsFound = false
        
        spaces = [
        
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
        
        ]
        
    

        
    }

   


}