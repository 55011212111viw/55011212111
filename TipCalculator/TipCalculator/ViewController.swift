//
//  ViewController.swift
//  TipCalculator
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var totalTextFeild : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextview : UITextView!
    
    let tipCalc = TipCalculatorModel(total : 33.25,taxPct: 0.06)
    func refreshUI(){
    totalTextFeild.text = String(format: "%0.2f",tipCalc.total)
    taxPctSlider.value = Float(tipCalc.taxPct)*100.0
    taxPctLabel.text = "Tax Precentage (\(Int(taxPctSlider.value))%)"
    resultsTextview.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTapped(sender: AnyObject) {
        //1
       tipCalc.total = Double((totalTextFeild.text as NSString).doubleValue)
        //2
        let possibleTips = tipCalc.returnPossibleTip()
        var results = ""
        //3
        for (tipPct, tipVaue) in possibleTips{
          //4
            results += "\(tipPct)%: \(tipVaue)\n"
        }
        //5
        resultsTextview.text = results
    }
    @IBAction func taxPercentage (sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value)/100.0;
        refreshUI()
    }
    @IBAction func viweTapped(sender: AnyObject) {totalTextFeild.resignFirstResponder()
    }
    

}

