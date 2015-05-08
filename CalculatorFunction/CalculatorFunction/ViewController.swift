//
//  ViewController.swift
//  CalculatorFunction
//
//  Created by Reed Carson on 5/5/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
// ^ subclass            ^superclass
    
    
    var firstNumber = ""
    var secondNumber = ""
    
    var currentOperation = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func PressButton1(sender: UIButton) {
   
//        println(sender.currentTitle!)
        
       let number = sender.currentTitle!
        
        
        if currentOperation.isEmpty {
           
            firstNumber += number
            
        } else {
            
            secondNumber += number
        }
        
    //    println("Pressed Button " + sender.currentTitle!)
        
    
    }
  
    
    
    @IBAction func OperatorPressed(sender: UIButton) {
   
        
        let operation = sender.currentTitle!
        
        if operation != "=" { currentOperation = operation}
        
        else
        
        {  switch currentOperation {
             case "+":
          
                
                let value = firstNumber.toInt()! + secondNumber.toInt()!
                
                
            println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
            
            
           
        
        case "-":
            println("l")
            
            
           
            
            
            
        default :
            println("blah")
            
            
        }
    
        
            
        }
        


        
        
        
        
        
//        if operation == "+" {
//            
//             add number
//            
//        }
//    
//        if operation == "-" {
//            
//         subtract number
//        }
//        
//        if operation == "=" {
//        
//            run equation
//        
//        }
        
        
        
    }
    
    
    
    
}

