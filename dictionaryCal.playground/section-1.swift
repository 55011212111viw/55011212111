func returnPossbleTips()->[Int: Double]{
  let possibleTipsInferred = [0.15.0.18.0.20]
  let possibleTipsExplicit:[Double] = [0.15,0.18,0.20]
    
    var retval = Dictionary<Int,Double>()
    for possibleTips in possibleTipsInferred{
        let intPct = int(possibleTips*100)
        
        retval[intPct] = calcTipWithTipPct(possibleTips)
    }
    return retval
}
