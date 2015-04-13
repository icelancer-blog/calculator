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
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypeNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypeNumber = true
        }

    }

}

