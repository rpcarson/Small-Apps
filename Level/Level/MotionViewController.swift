//
//  ViewController.swift
//  Level
//
//  Created by Reed Carson on 6/29/15.
//  Copyright © 2015 Reed Carson. All rights reserved.
//

import CoreMotion
import UIKit
import SpriteKit


var posX: Double = 1
var posY: Double = 1


class MotionViewController: UIViewController {

    let manager = CMMotionManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        var motionScene = MotionScene()
        
        let sceneView = SKView(frame: view.frame)
        view.addSubview(sceneView)
        
        sceneView.presentScene(motionScene)

        
   
//        manager.startDeviceMotionUpdates(NSOperationQueue.mainQueue(), withHandler:  { (deviceMotion, error) -> Void in
//            
//            println(deviceMotion.attitude.yaw)
//            
//            
//        })

//        manager.startMagnetometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (magnetometerMotion, error) -> Void in
//            
//            
//            
//            println(magnetometerMotion)
//            
//            })
        
            

        
        
     manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (deviceMotion, error) -> Void in
        
        let quat = deviceMotion.attitude.quaternion
        let myRoll = (atan2(2*(quat.y*quat.w - quat.x*quat.z) 1 - 2*quat.y*quat.y - 2*quat.z*quat.z))
        
        
        let myPitch = atan2(2*(quat.x*quat.w - quat.y*quat.z) 1 - 2*quat.x*quat.x - 2*quat.z*quat.z)
        
        
        
        println(deviceMotion.attitude.yaw)
        
//        deviceMotion.rotationRate.x
//        deviceMotion.rotationRate.y
//        
//        motionScene.physicsWorld.gravity = CGVector(dx: -posY * 50, dy: posX * 50)
//        
//        
//        posX = deviceMotion!.rotationRate.x
//        posY = deviceMotion!.rotationRate.y
//        
        
        }
        
    }

}

