//
//  ViewController.swift
//  Calculator
//
//  Created by icelancer on 2015. 4. 14..
//  Copyright (c) 2015년 icelancer. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!

    
    var userIsInTheMiddleOfTypeNumber: Bool = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypeNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypeNumber = true
        }

    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypeNumber {
            enter()
        }
        
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
        
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypeNumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            // nil return
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypeNumber = false
        }
    }

}

