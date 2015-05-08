
import UIKit
//   May 6th


enum ShapeType : Int {
    case Triangle = 3
    case Rectangle = 4
    case Pentagon = 5
    case Hexagon = 6
    case Septagon = 7
    case Octogon = 8
    case Nonagon = 9
}





class Shape {
    var sides: Int!
    var fillColor: UIColor?
    var strokeColor: UIColor?

    init(type: ShapeType) {
        
sides = type.rawValue
        
        
        //        switch type {
//        case .Rectangle :
//            
//        case .Triangle :
//            
//        case .Hexagon :
//            
//        case .Nonagon :
//            
//        case .Pentagon :
//            
//        case .Septagon :
//            
//        case .Octogon :
        
//        }
        
    }
  
    
}

var square1 = Shape(type: .Rectangle)

//square1.fillColor = UIColor.blueColor()
var squarepixels = 4 * square1.sides

var triangle1 = Shape(type: .Triangle)
var trianglepixels = 4 * triangle1.sides



var sidecount = square1.sides




for s in 0..<square1.sides {
    
    s
}




var num1: Int?
var num2: Int?

num1 = 4

num1! + 4
num2

if num1 != nil { num1! }
if num2 != nil { num2! }







class Mouth: BodyPart {
    
    var lipsColor: UIColor!
    var teethCount: Int!
    
    var badBreath: Bool = false
    var fullOfFood: Bool = false
    
    init(teeth: Int, lips: UIColor) {
        
        teethCount = teeth
        lipsColor = lips
        
    }
    
    func chewFood(food: AnyObject) {
        
//        chew 3 times then swallow
    }
    
    func yawn() {
        
        
    }
}





// Create a playground

// make a class BodyPart

// make 20 Classes that are BodyParts

//Main Class BodyPart
//Sublclass Finger, Foot, Nipple, Eye, Tooth


//each class will have 3 properties (eyeColor: UIColor, teeth, Int)
//each class will have 3 methods (chew(), sprain(), etc)
//at least 15 methods need to be called from another Bodypart
//(One bodypart tells another bodyoart something)

// at least 10 properties need to be other BodyParts







class Face {
    
    var mouth: Mouth = Mouth(teeth: 0, lips: UIColor.blackColor())
    
}




class BodyPart {
    
    
}













