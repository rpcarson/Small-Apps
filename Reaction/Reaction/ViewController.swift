//
//  ViewController.swift
//  Reaction
//
//  Created by Reed Carson on 7/1/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import GameKit


class ViewController: UIViewController, GKGameCenterControllerDelegate{
    
    @IBOutlet weak var goButton: CircleButton!
    
    
    
    @IBOutlet weak var topScore: UILabel!
    
    @IBAction func goButton(sender: AnyObject) {
        
        if let gameVC = storyboard?.instantiateViewControllerWithIdentifier("gameVC") as? GameViewController {
            
            navigationController?.viewControllers = [gameVC]
            
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.blueColor()
        
        GKLocalPlayer.localPlayer().authenticateHandler = { (viewController, error) -> Void in
            
            if viewController != nil {
                
                self.presentViewController(viewController, animated: true, completion: nil)
                
            }else{
                
                println(GKLocalPlayer.localPlayer().authenticated)
                
                self.loadScore()
                
            }
            
        }
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        loadScore()
        
        
    }
    
    func loadScore() {
        
        if GKLocalPlayer.localPlayer().authenticated == false { return }
        
        GKLeaderboard.loadLeaderboardsWithCompletionHandler { (leaderboards, error) -> Void in
            
            for leaderboard in leaderboards as! [GKLeaderboard] {
                
                
                if leaderboard.identifier == "circles_touched" {
                    
                    leaderboard.loadScoresWithCompletionHandler({ (scores, error) -> Void in
                        
                      println(scores)
                        
                        self.topScore.text = "\(leaderboard.localPlayerScore.value)"
                        
                    })
                }
                
            }
            
            
        }
        
    }
    
    @IBAction func showLeaderboard(sender: AnyObject) {
    
    let gameVC = GKGameCenterViewController()
        gameVC.leaderboardIdentifier = "circles_touched"
        gameVC.gameCenterDelegate = self
        presentViewController(gameVC, animated: true, completion: nil)
    
    
    
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!) {
        
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
}

