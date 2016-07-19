//
//  ViewController.swift
//  Calculator2
//
//  Created by 丁建新 on 16/7/6.
//  Copyright © 2016年 丁建新. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var acBtn: UIButton!
    @IBOutlet var signBtn: UIButton!
    @IBOutlet var percentBtn: UIButton!
    @IBOutlet var divisionBtn: UIButton!
    @IBOutlet var sevenBtn: UIButton!
    @IBOutlet var eightBtn: UIButton!
    @IBOutlet var nineBtn: UIButton!
    @IBOutlet var multiplicationBtn: UIButton!
    @IBOutlet var fourBtn: UIButton!
    @IBOutlet var fiveBtn: UIButton!
    @IBOutlet var sixBtn: UIButton!
    @IBOutlet var minusBtn: UIButton!
    @IBOutlet var oneBtn: UIButton!
    @IBOutlet var twoBtn: UIButton!
    @IBOutlet var threeBtn: UIButton!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var zeroBtn: UIButton!
    @IBOutlet var decimalBtn: UIButton!
    @IBOutlet var equalBtn: UIButton!
    //响应事件，并与相关按钮相关联
    
    
    private var brain=CalculatorBrain()
    //与屏幕相关联
    @IBOutlet private weak var  display: UILabel!
    
    
    var userIsInTheMiddleOfTyping=false
    
    var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text=String(newValue)
        }
    }
    
    //按清除键的响应事件
    
    @IBAction func acBtnAction(sender: UIButton)
        
    {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping=false
            
        }
        if let mathematicalSymbol=sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        
        displayValue=brain.clean   }
    
    
    
    //按运算符的响应事件
    
    
    @IBAction func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping=false
            
        }
        if let mathematicalSymbol=sender.currentTitle{
            brain.performOperation(mathematicalSymbol)
        }
        displayValue=brain.result
        
    }
    
    
    //按小数点的响应事件
    var isDotTyped = false
    @IBAction func decBtnAction(sender:UIButton)
    {
        if !isDotTyped {
            if userIsInTheMiddleOfTyping {
                display.text = display.text! + "."
            } else {
                display.text = "0."
                userIsInTheMiddleOfTyping = true
            }
            isDotTyped=true  }
    }
    
    
    
    
    
    
    
    
    //按数字键的响应事件
    @IBAction func numBtnAction(sender: UIButton)
    {
        let num=sender.currentTitle!
        if userIsInTheMiddleOfTyping
        {
            let textCurrentlyInDisplay=display!.text!
            display!.text=textCurrentlyInDisplay+num
        }
        else
        {display!.text=num}
        userIsInTheMiddleOfTyping=true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


