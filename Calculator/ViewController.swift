//
//  ViewController.swift
//  Calculator
//
//  Created by Cергей Иванович on 20.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResult: UILabel!
    
    @IBOutlet var RounBotton: [UIButton]!
    
    var stillTyping = false
    var point = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSing: String = ""
    var currentInput: Double  {
        get {
            return Double(displayResult.text!)!
            
        } set {
            let value = ("\(newValue)")
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResult.text = valueArray[0]
            } else {
                displayResult.text = ("\(newValue)")
            }
            stillTyping = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let widthButton = RounBotton[1].frame.width
        for i in RounBotton {
            i.layer.cornerRadius = widthButton / 2
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        if stillTyping {
            displayResult.text! += number }
        else {
            displayResult.text = number
            stillTyping = true
        }
    }
    
    @IBAction func MathOperation(_ sender: UIButton) {
        operationSing = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        point = false
    }
    
    @IBAction func ResultPressed(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        point = false
        switch operationSing {
        case "+":
            currentInput = firstOperand + secondOperand
            stillTyping = false
        case "-":
            currentInput = firstOperand - secondOperand
            stillTyping = false
            
        case "х":
            currentInput = firstOperand * secondOperand
            stillTyping = false
            
        case "/":
            currentInput = firstOperand / secondOperand
            stillTyping = false
            
        default:
            break
        }
    }
    
    @IBAction func cleraButton(_ sender: Any) {
        firstOperand = 0
        secondOperand = 0
        displayResult.text = "0"
        currentInput = 0
        stillTyping = false
        operationSing = ""
        point = false
    }
    
    @IBAction func plusMinus(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentButoon(_ sender: UIButton) {
        if firstOperand == 0 {
            firstOperand = firstOperand / 100
        } else {
            secondOperand = firstOperand * currentInput/100
        }
    }
    
    @IBAction func pointButton(_ sender: Any) {
        if stillTyping && !point {
            displayResult.text! += "."
            point = true
        } else {
            if !stillTyping && !point {
                displayResult.text = "0."
            }
        }
    }
}
    
    

