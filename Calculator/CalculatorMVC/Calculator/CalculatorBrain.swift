//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 刘强 on 2018/2/8.
//  Copyright © 2018年 刘强. All rights reserved.
//

import Foundation


//函数方法默认为公有
class CalculatorBrain
{
    //enum 不能继承 但有函数
    private enum Op //: Printable
    {
        case Operand (Double)  //操作数
        case SingleOperation (String, (Double)->Double)
        case DoubleOperation(String, (Double, Double)->Double)
        
        var description: String
        {
            get
            {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .SingleOperation(let symbol, _):
                    return symbol
                case .DoubleOperation(let symbol, _):
                    return symbol
                }
            }
        }
    }
    private var opStack = [Op]()
    //private var opStack = Array<Op>()
    
    private var knownOps = [String: Op]() //dictionary
    
    init()
    {
//        knownOps["✖️"] = Op.DoubleOperation("✖️") {$0 * $1}
        knownOps["✖️"] = Op.DoubleOperation("✖️", *)
        knownOps["➗"] = Op.DoubleOperation("➗") {$1 / $0}
        knownOps["➕"] = Op.DoubleOperation("➕") {$0 + $1}
        knownOps["➖"] = Op.DoubleOperation("➖") {$1 - $0}
//        knownOps["✔️"] = Op.SingleOperation("✔️") { sqrt($0)}
        knownOps["✔️"] = Op.SingleOperation("✔️",sqrt)
        
    }
    
    //ops: [Op]  equals  let ops:[Op]
    //函数返回的是Tuple(元组, mini struct)  
    //return 1 求值运算结果。 2 剩下的未使用的堆栈
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps:[Op])
    {
        if !ops.isEmpty
        {
            var remainingOps = ops
            let op = remainingOps.removeLast()// cannot use "let op = ops.removeLast()"  because ops is let
            switch op
            {
            case .Operand(let operand):
                return (operand, remainingOps)
                
            case .SingleOperation(_, let operation):
                let operandEvaluation = evaluate(ops:remainingOps)
                if let operand = operandEvaluation.result
                {
                    return ( operation(operand), operandEvaluation.remainingOps)
                }
                
            case .DoubleOperation(_, let operation):
                let op1Evaluation = evaluate(ops: remainingOps)
                if let operand1 = op1Evaluation.result
                {
                    let op2Evaluation = evaluate(ops: op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result
                    {
                        return ( operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
            
        }
        
        return (nil, ops)
    }
    
    func evaluate() ->Double?
    {
        let (result, remain) = evaluate(ops: opStack)
        print("\(opStack) = \(String(describing: result)) with \(remain) left over")
        return result
    }
    func pushOperand( operand: Double) ->Double?
    {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) ->Double? {
        
        if let operation = knownOps[symbol]
        {
            opStack.append(operation)
        }
        return evaluate()
    }
    
}
