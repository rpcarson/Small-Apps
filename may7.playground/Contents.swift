//: Playground - noun: a place where people can play

import UIKit



//class homework notes

// class creates a blueprint, defines an object. a class is what could happen.

//each object will work with itself and talk to other objects

class BodyPart {
    
    var isDamaged = false
    
    
}

class Arm : BodyPart {
    
    var hand: Hand!
    
    override init() {
        
        hand = Hand()
    }
    


}



class Hand : BodyPart {
    
    var fingers: [Finger] = []
    
    override init() {
    
        fingers.append(Finger())
        fingers.append(Finger())
        fingers.append(Finger())
        fingers.append(Finger())
        fingers.append(Thumb())
        
        
        
    }
    
    func closeHand() {
        
        for finger in fingers {
            finger.fingerCurl()
            
        }
    }
    
}

class Finger : BodyPart {
    
    var boneCount: Int!
    
    func fingerCurl() {
        
        println("Curling \(self)")
    }
    
}


class Thumb : Finger {
    
    var isDoubleJointed = false
    
}


var leftArm = Arm()

leftArm.hand.closeHand()



//var pointerFinger = Finger()
//// ^ parentheses after Finger denote function, it initializes pointerFinger based on class rules of Finger
//
//pointerFinger.boneCount = 3
//pointerFinger.isDamaged = true
//
//var leftThumb = Thumb()
//
//leftThumb.isDoubleJointed = true
//leftThumb.isDamaged = false
//leftThumb.boneCount = 2



