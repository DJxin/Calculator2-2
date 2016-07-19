//
//  CalculatorBrain.swift
//  Calculator2
//
//  Created by 丁建新 on 16/7/12.
//  Copyright © 2016年 丁建新. All rights reserved.
//

import Foundation
class CalculatorBrain
{
    private var accumulator=0.0
    func setOperand(operand: Double){
        accumulator=operand
    }
    
    private var operations: Dictionary<String,Operation>=
        [
            
            "×":Operation.BinaryOperation({$0 * $1}),
            "÷":Operation.BinaryOperation({$0 / $1}),
            "+":Operation.BinaryOperation({$0 + $1}),
            "−":Operation.BinaryOperation({$0 - $1}),
            "%":Operation.UnaryOperation ({$0 / 100} ),
            "±":Operation.UnaryOperation({ -$0  }),
            "=":Operation.Equals
    ]
    
    
    
    
    private enum Operation {
        case Constant(Double)
        case BinaryOperation((Double,Double)-> Double)
        case UnaryOperation((Double)-> Double)
        case Equals
        
        
    }
    func performOperation(symbol:String){
        if  let operation=operations[symbol]
        {
            switch operation{
            case.Constant(let value):
                accumulator=value
            case.BinaryOperation(let function):
                executePendingBinaryOperation()
                pending=PendingBinaryOperationInfo(binaryFunction: function,firstOperand: accumulator)
            case.UnaryOperation(let function ):
                accumulator=function(accumulator)
            case.Equals:
                executePendingBinaryOperation()
            }
        }
        
    }
    private func executePendingBinaryOperation()
    {
        if pending != nil
            
        {
            accumulator=pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending=nil
        }
    }
    
    private var pending:PendingBinaryOperationInfo?
    private struct PendingBinaryOperationInfo{
        var binaryFunction:(Double,Double)->Double
        var firstOperand:Double
        
    }
    var clean:Double  {
        get {
            return 0}
    }
    
    
    var result:Double{
        get{
            
            return accumulator }
        
    }
}
