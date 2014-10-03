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
    @IBOutlet var resultsTableView : UITableView!
    @IBOutlet var tableView: UITableView!
    
    let tipCalc = TipCalculatorModel(total : 33.25,taxPct: 0.06)
    var possibleTips = Dictionary<Int,(tipAmt:Double,total:Double)>()
    var sortedKeys:[Int] = []
    
    func tableView(tableview:UITableView!,numberOfRowsInSection section : Int)->Int{
        return sortedKeys.count
    } //UITableViewDataSource methods
    
      func numberOfSectionInTableView(tableView : UITableView!)->Int{
        return 1
      }
      func tableView(tableView : UITableView!,didSelectRowAtIndexPath indexPath:NSIndexPath!){
        
      }
    
    func tableView(tableView : UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!)->UITableViewCell!{
    var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
       
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel!.text = "\(tipPct)%:"
        cell.detailTextLabel!.text = String(format: "Tip : $%0.2f,Total: $%0.2f", total)
        return cell
        
    }
    
   
    func refreshUI(){
    totalTextFeild.text = String(format: "%0.2f",tipCalc.total)
    taxPctSlider.value = Float(tipCalc.taxPct)*100.0
    taxPctLabel.text = "Tax Precentage (\(Int(taxPctSlider.value))%)"
    resultsTableView.reloadData()
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
        
        tipCalc.total = Double((totalTextFeild.text as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTip()
        let  sortedKeys = sorted(Array(possibleTips.keys))
        tableView.reloadData()
    }
    @IBAction func taxPercentage (sender: AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value)/100.0;
        refreshUI()
    }
    @IBAction func viweTapped(sender: AnyObject) {totalTextFeild.resignFirstResponder()
    }
    

}

