//
//  ViewController.swift
//  SimpleButtons
//
//  Created by Reed Carson on 5/4/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber = ""
    
    var secondNumber = ""
    
    var currentOperation = ""
   
    @IBOutlet weak var Label: UILabel!
   
    @IBOutlet weak var first: UILabel!
   
    @IBOutlet weak var op: UILabel!
    
    @IBOutlet weak var sec: UILabel!
    
    
    

    @IBAction func Clear(sender: UIButton) {
        
        Label.text = ""
        op.text = ""
        first.text = ""
        sec.text = ""
        
        firstNumber = ""
        secondNumber = ""
        currentOperation = ""
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func ButtonPress(sender: UIButton) {
        
        
        let number = sender.currentTitle!
        
        
        if currentOperation.isEmpty {
            firstNumber += number
        }
        else
        { secondNumber += number }
        
        println(sender.currentTitle!)
        
        first.text = firstNumber
        sec.text = secondNumber
        
    }
    
    @IBAction func Operation(sender: UIButton) {
        
        let operation = sender.currentTitle!
        

        
        println(sender.currentTitle!)
        
        
        
        
        if operation != "=" { currentOperation = operation
        
            
            op.text = operation
        
        }
            
        else
            
        {
            
            switch currentOperation
            
            {
                
                
            
                
            case "+":
                
                let value = firstNumber.toInt()! + secondNumber.toInt()!
                
                Label.text = "\(value)"

                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
            case "-":
                
                let value = firstNumber.toInt()! - secondNumber.toInt()!
                
                Label.text = "\(value)"
                
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
            case "X":
                
                let value = firstNumber.toInt()! * secondNumber.toInt()!
                
                Label.text = "\(value)"
                
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
            case "÷":
                
                let value = firstNumber.toInt()! / secondNumber.toInt()!
                
               Label.text = "\(value)"
                
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
            
            default :
                println("bs")
              
            
               
            }
            

            
            firstNumber = ""
            secondNumber = ""
            currentOperation = ""
            
           
            first.text = ""
            sec.text = ""
            op.text = ""
            
            
        }
        
        
        
        
    }
    
    
    
    
}



