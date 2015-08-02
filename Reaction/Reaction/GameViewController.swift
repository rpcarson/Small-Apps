//
//  GameViewController.swift
//  Reaction
//
//  Created by Reed Carson on 7/1/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import GameKit
import Swift



class GameViewController: UIViewController {
    
 
    
    
    var scoreLabel1 = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    
    var score: Int!
    
    
    var timerBar = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
    
    var currentScore = 0 {
        
        didSet { scoreLabel1.text = "\(currentScore)"
    }
    
    }

    var currentCircles: [CircleButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scoreLabel1.textColor = UIColor.whiteColor()
        scoreLabel1.font = UIFont(name: "HelveticaNeue-UltraLight", size: 80)
        
        scoreLabel1.text = "0"
        scoreLabel1.frame.origin.y = view.frame.height - 100
        scoreLabel1.frame.size.width = view.frame.width
        scoreLabel1.textAlignment = .Center
        
        
        
        timerBar.backgroundColor = UIColor.redColor()
        view.addSubview(timerBar)
        view.addSubview(scoreLabel1)
        
        animateNewCirclesIn()
    
    }
    
    
    func runTimer(seconds: NSTimeInterval) {
    
   
        timerBar.layer.removeAllAnimations()
        
        timerBar.frame.size.width = view.frame.width
        
        UIView.animateWithDuration(seconds, animations: { () -> Void in
            
       self.timerBar.frame.size.width = 0
            
            
            }) { (finished) -> Void in
            if finished { self.gameOver() }
            
            
        }
    
    
    
    }
    
    func animateNewCirclesIn() {
        
        
        runTimer(5.0)
        
        
        var cW = (view.frame.width - 120) / 2
        var cR = cW / 2
        
        
        // top left, top right, bott left, bott right
        // (x,y)
        
        var directions: [(CGFloat,CGFloat)] = [(-1,-1),(1,-1),(-1,1),(1,1)]
       
        for lobster in 0..<4 {
            
            
            
            
            var circle = CircleButton()
            circle.choice = lobster
            circle.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            circle.center = view.center
            view.addSubview(circle)
            
            circle.alpha = lobster == currentCorrectChoice ? 1.0 : 0.5
            
            circle.addTarget(self, action: "tapCircle:", forControlEvents: .TouchUpInside)
            
            currentCircles.append(circle)
            
            let (dx,dy) = directions[lobster]
            
          
            UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                
                circle.alpha = 0.5
                
                
                circle.frame.size.width = cW
                circle.frame.size.height = cW
                
                let y = self.view.center.y + dy * (cR + 10)
                
                let x = self.view.center.x + dx * (cR + 10)
                
                circle.center = CGPoint(x: x, y: y)
                
            }, completion: nil)
            
            
        }
        
    }
    func animateOldCirclesOut() {
        
        var cW = (view.frame.width - 120) / 2 * 3

        
        for circle in currentCircles {
            
            circle.choice = 4
            
            let distX = circle.center.x - view.center.x
            let disty = circle.center.y - view.center.y

            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                circle.frame.size.width = cW
                circle.frame.size.height = cW
                
                circle.center = CGPoint(x: distX * 6 + self.view.center.x, y: disty * 6 + self.view.center.y)
                
//                circle.center = CGPoint(x: self.view.center.x, y: self.view.center.y)

                
            }, completion: { (finished) -> Void in
                
                circle.removeFromSuperview()
                
                
            })
        }
    }
    
    

    var currentCorrectChoice = Int(arc4random_uniform(4))
    
    func tapCircle(circle: CircleButton) {
        
        if circle.choice == currentCorrectChoice {
            
            
            
            
            currentScore++
            
            let reportScore = GKScore(leaderboardIdentifier: "circles_touched")
            reportScore.value = Int64(currentScore)
            
           GKScore.reportScores([reportScore], withCompletionHandler: { (error) -> Void in
            
            
            
            println(self.currentScore)
            
           })
            
            
            currentCorrectChoice = Int(arc4random_uniform(4))
            
            animateOldCirclesOut()
            currentCircles = []
            animateNewCirclesIn()
            
            
            
        } else {
        
        gameOver()
    
    }
    
    }
    
    
    
    func gameOver() {
        
        
        
        animateOldCirclesOut()
        
        let gameOverLabel = UILabel(frame: view.frame)
        gameOverLabel.textAlignment = .Center
        gameOverLabel.text = "GAYME OVER"
        gameOverLabel.textColor = UIColor.whiteColor()
        gameOverLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 60)
        
        gameOverLabel.alpha = 0
        
        view.addSubview(gameOverLabel)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            gameOverLabel.alpha = 1
            self.scoreLabel1.alpha = 0
            
            }) { (finished) -> Void in
                
                UIView.animateWithDuration(1.6, animations: { () -> Void in
                    
                    
                    gameOverLabel.alpha = 0
                    
                    
                    
                    }) { (finished) -> Void in
                        
                        self.endGame()
                }
            }
        
        }

    func endGame() {
        
        if let startVC = storyboard?.instantiateViewControllerWithIdentifier("startVC") as? ViewController
        
        {
            
            navigationController?.viewControllers = [startVC]
            
            
        }
    }
}
