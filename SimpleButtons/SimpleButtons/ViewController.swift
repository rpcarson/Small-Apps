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
    
    var calculatedNumber = ""
    
    var currentNumber = ""
    
    var currentNum1 = ""
    
    
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func Clear(sender: UIButton) {
        
        Label.text = ""
        
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
    
    
    
    @IBAction func invertValue(sender: UIButton) {
        
        var currentNum1 = numberFormatter.numberFromString("\(currentNumber)")
        
        if currentNumber == firstNumber {
            
            if currentNum1 != nil {
                
                var numberFloat = currentNum1!.doubleValue
                
                numberFloat = numberFloat * -1
                
                if numberFloat % 1 == 0 {
                    
                    let formattedValue = String(format: "%.0f", numberFloat)
                    
                    firstNumber = "\(formattedValue)"
                    
                    println(numberFloat)
                    
                } else {
                    
                    firstNumber = "\(numberFloat)"
                    
                    println(numberFloat)

                    
                }
                
                
                Label.text = firstNumber
                
                currentNumber = firstNumber
                
            }
            
        }
        
        if currentNumber == secondNumber {
            
            if currentNum1 != nil {
                
                var numberFloat = currentNum1!.floatValue
                
                numberFloat = numberFloat * -1
                
                if numberFloat % 1 == 0 {
                    
                    let formattedValue = String(format: "%.0f", numberFloat)
                    
                    secondNumber = "\(formattedValue)"
                    
                } else {
                    
                    secondNumber = "\(numberFloat)"
                    
                }
                
                Label.text = "\(firstNumber) \(currentOperation) \(secondNumber)"
                
                currentNumber = secondNumber
                
            }
        }
        
    }
    
    
    @IBAction func ButtonPress(sender: UIButton) {
        
        
        println(currentNum1)
        
        let number = sender.currentTitle!
        
        if currentOperation.isEmpty {
            
            if calculatedNumber != "" {
                
                calculatedNumber = ""
                firstNumber = ""
                
            }
            
            firstNumber += number
            
            currentNumber = firstNumber
            
            Label.text = currentNumber
            
            println(currentNumber)
            
        }
            
        else
            
        {
            
            secondNumber += number
            
            Label.text = "\(firstNumber) \(currentOperation) \(secondNumber)"
            
            currentNumber = secondNumber
            
            println(currentNumber)
            
        }
        
        
        println("second number = \(secondNumber)")
        println("first number = \(firstNumber)")
        
        
    }
    
    @IBAction func Operation(sender: UIButton) {
        
        if firstNumber == "." {
            
            firstNumber = "0.0"
            
        }
        
        if secondNumber == "." {
            
            secondNumber = "0.0"
        }
        
        let number1 = numberFormatter.numberFromString("\(firstNumber)")
        let number2 = numberFormatter.numberFromString("\(secondNumber)")
        
        let operation = sender.currentTitle!
        
        println(sender.currentTitle!)
        
        if operation != "=" {
            
            if firstNumber != "" {
                
                currentOperation = operation
                
                Label.text = "\(firstNumber) \(currentOperation) \(secondNumber)"
                
            }
            
        }
            
        else
            
        {
            switch currentOperation
                
            {
                
            case "+":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 + numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"

                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
                    calculatedNumber = "\(val3)"
                    
                    firstNumber = "\(val3)"
                    secondNumber = ""
                    currentOperation = ""
                    
                }
                
            case "-":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 - numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
                    calculatedNumber = "\(val3)"
                    firstNumber = "\(val3)"
                    secondNumber = ""
                    currentOperation = ""
                    
                }
                
            case "X":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 * numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)
                        
                        Label.text = "\(formattedValue)"
                        
                    } else {
                        
                        Label.text = "\(val3)"
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
                    calculatedNumber = "\(val3)"
                    firstNumber = "\(val3)"
                    secondNumber = ""
                    currentOperation = ""
                    
                }
                
            case "÷":
                
                if secondNumber != "" {
                    
                    let numberFloat1 = number1!.doubleValue
                    
                    let numberFloat2 = number2!.doubleValue
                    
                    let val3 = numberFloat1 / numberFloat2
                    
                    if val3 % 1 == 0 {
                        
                        let formattedValue = String(format: "%.0f", val3)

                        Label.text = "\(formattedValue)"

                    } else {
                    
                    Label.text = "\(val3)"
                        
                    }
                    
                    println("\(firstNumber) \(currentOperation) \(secondNumber) = \(val3)")
                    
                    calculatedNumber = "\(val3)"
                    firstNumber = "\(val3)"
                    secondNumber = ""
                    currentOperation = ""
                    
                }
                
                
            default :
                
                println("no case")
                
            }
            
        }
        
    }
    
}

