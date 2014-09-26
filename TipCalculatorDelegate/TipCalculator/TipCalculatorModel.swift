//
//  calculator.swift
//  TipCalculator
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import Foundation

class TipCalculatorModel{
    
    var total:Double
    var taxPct:Double
     var subtotal:Double
    var tipAmt:Double
    var finalTotal:Double
    
    init(total:Double,taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    func calcTipWithTipPct(tipPct:Double)->(tipAmt:Double,totol:Double){
        
        let tipAmt = subtotal * tipAmt
        let finalTotal = total * tipAmt
        return (tipAmt,finalTotal)
    }
    
    func returnPossibleTip() ->[Int: (tipAmt:Double,totol:Double)]{
        
        let possibleTipInferred = [0.15,0.18,0.20]
        let possibleTipExplicit:[Double] = [0.15,0.18,0.20]
        
        var retval = Dictionary<Int,(tipAmt:Double,totol:Double)>()
        for possibleTip in possibleTipInferred{
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

