class TipCalculator{
    
    let total:Double
    let texPct:Double
    let subtotal:Double
    
    init(total:Double,taxPct:Double){
        self.total = total
        self.texPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    func calcTipWithTipPct(tipPct:Double)->Double{
         return subtotal * tipPct
    }
    
    func returnPossibleTip() ->[Int: Double]{
        let possibleTipInferred = [0.15,0.18,0.20]
        let possibleTipExplicit:[Double] = [0.15,0.18,0.20]
        var numberOfItems = possibleTipInferred.count
        
        var retval = [Int: Double]()
        for possibleTip in possibleTipInferred{
            let intPct = Int(possibleTip*100)
            
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.returnPossibleTip()