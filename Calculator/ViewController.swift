//
//  ViewController.swift
//  Calculator
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0
    var result = 0.0
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
    {
        
        
        
        if performingMath == true
        {
            label.text = "0"
            if sender.tag == 11 //decimal
            {
                label.text = label.text! + String(".")
            }
            else{
            label.text = String(sender.tag-1)
            }
            numberOnScreen = Double(label.text!) ?? 0.0
            performingMath = false
        }
        else
        {
            if sender.tag == 11 //Decimal
            {
                if (label.text?.contains("."))!
                {
                    return
                }
                label.text = label.text! + String(".")
                }
                else {
                
            label.text = label.text! + String(sender.tag-1)
        }
            numberOnScreen = Double(label.text!) ?? 0.0
            
        }
      
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if sender.tag == 12
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
       
        if label.text != "" && sender.tag != 13 && sender.tag != 18
        {
            //label.text = ""
            previousNumber = Double(label.text!) ?? 0.0
         if sender.tag == 14  // Divide
         {
            label.text = "/";
            
         }
        else if sender.tag == 15 //Multiply
         {
            label.text = "*";
            
         }
    else if sender.tag == 16 //Minus
         {
            label.text = "-";
            
         }
    else if sender.tag == 17 //Plus
         {
            label.text = "+";
            }
    else if sender.tag == 13 // percentage
             {
                 label.text = String(previousNumber/100)
             }
            else if sender.tag == 11  // decimal
            {
                label.text = ".";
            }
            operation = sender.tag
            performingMath = true;
            
        }
         else if sender.tag == 18
        {
            if operation == 14
            {
                label.text = String(previousNumber / numberOnScreen)
                result = Double(label.text!) ?? 0.0
        }
        else if operation == 15
            {
                label.text = String(previousNumber * numberOnScreen)
               
                result = Double(label.text!) ?? 0.0
                }
        else if operation == 16
        {
            label.text = String(previousNumber - numberOnScreen)
            result = Double(label.text!) ?? 0.0
            }
            else if operation == 17
            {
                label.text = String(previousNumber + numberOnScreen)
                result = Double(label.text!) ?? 0.0
                }
            else if operation == 13
            {
                label.text = String(format: "%.2f", previousNumber / 100)
                 result = Double(label.text!) ?? 0.0
            }
            

    }
        else if sender.tag == 12
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        }
        func roundDoubleInt()  {

         print(result)
         
         if result.rounded(.up) == result.rounded(.down){
             
             let result = Int(self.result)
             label.text = String(result)
             self.result = Double(result)
         }else{
             label.text = String(result)
         }
        
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

