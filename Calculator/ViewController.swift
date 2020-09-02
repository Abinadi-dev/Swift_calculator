//
//  ViewController.swift
//  Calculator
//
//  Created by The App Experts on 31/08/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var value: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    @IBAction func Click1(_ sender: UIButton) {
        if performingMath == true {

        label.text = String(sender.tag-1)
        value = Double(label.text!)!

        performingMath = false

        }

        else {

        label.text = label.text! + String(sender.tag-1)

        value = Double(label.text!)!

        }
    }
    
    @IBAction func Buttons(_ sender: UIButton) {
        if(label.text != "" && sender.tag != 11 && sender.tag != 16){
        if let previous = Double(label.text!){
            previousNumber = previous
        }
        
        if sender.tag == 12 { //Divide

        label.text = "/";

        }

        if sender.tag == 13 { //Multiply

        label.text = "x";

        }

        if sender.tag == 14 { //Subtract

        label.text = "-";

        }

        if sender.tag == 15 { //Add

        label.text = "+";

        }

        operation = sender.tag

        performingMath = true;

        }

        else if sender.tag == 16 {

        if operation == 12{ //Divide
            
            if(value.isZero){
                label.text = "Not a number"
            }
            else{
                value = previousNumber / value
                label.text = String(value)
            }
            
            

        }

        else if operation == 13{ //Multiply

        value = previousNumber * value
        label.text = String(value)

        }

        else if operation == 14{ //Subtract

        value = previousNumber - value
        label.text = String(value)

        }

        else if operation == 15{ //Add
        
        value = previousNumber + value
        label.text = String(value)

        }

        }

        else if sender.tag == 11{

        label.text = ""

        previousNumber = 0;

        value = 0;

        operation = 0;

        }
    }
    @IBAction func Percent(_ sender: UIButton) {
        value = value/100;
        label.text = String(value)
    }
    @IBAction func PlusMinus(_ sender: UIButton) {
        value = value * -1;
       label.text = String(value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

