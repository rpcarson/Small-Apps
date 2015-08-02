//
//  ViewController.swift
//  SimpleButtons
//
//  Created by Reed Carson on 5/4/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit



let numberFormatter = NSNumberFormatter()


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
        
        var firstNumArray: [String] = []
        var secNumArray: [String]   = []
        
        
        let number = sender.currentTitle!
        
        
        if currentOperation.isEmpty {
            
            firstNumber += number
           
        }
        else
        {
            
            secondNumber += number
        
        secNumArray.append(number)
        
        }
        
//        println(sender.currentTitle!)
        
        first.text = firstNumber
        sec.text = secondNumber
        
        println("second number = \(secondNumber)")
        println("first number = \(firstNumber)")
        println(firstNumArray.count)
        println(secNumArray.count)


        
    }
    
    

    
    @IBAction func Operation(sender: UIButton) {
        
        
        
        let number1 = numberFormatter.numberFromString("\(firstNumber)")
        let number2 = numberFormatter.numberFromString("\(secondNumber)")
        

        
        let operation = sender.currentTitle!
        
        println(sender.currentTitle!)
        
        if operation != "=" {
            
            currentOperation = operation
            
            op.text = operation
            
        }
            
        else
            
        {
            switch currentOperation
                
            {
                
            case "+":
                
                let numberFloat1 = number1!.floatValue
                
                let numberFloat2 = number2!.floatValue
                
                let val3 = numberFloat1 + numberFloat2
                
                let value = String(format: "%.5f", val3)
                
                Label.text = "\(value)"
                
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
            case "-":
                
                let numberFloat1 = number1!.floatValue
                
                let numberFloat2 = number2!.floatValue
                
                let val3 = numberFloat1 - numberFloat2
                
                let value = String(format: "%.5f", val3)
                
                Label.text = "\(value)"
                
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
            case "X":
                
                let numberFloat1 = number1!.floatValue
                
                let numberFloat2 = number2!.floatValue
                
                let val3 = numberFloat1 * numberFloat2
                
                let value = String(format: "%.5f", val3)
                
                Label.text = "\(value)"

                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
            case "÷":
                
                let numberFloat1 = number1!.floatValue
               
                let numberFloat2 = number2!.floatValue
                
                let val3 = numberFloat1 / numberFloat2
                
                let value = String(format: "%.5f", val3)

                Label.text = "\(value)"
                
                println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
                
            default :
                
                println("no case")
                
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



