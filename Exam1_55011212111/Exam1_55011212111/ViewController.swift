//
//  ViewController.swift
//  Exam1_55011212111
//
//  Created by student on 10/10/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textVolume: UITextField!
    @IBOutlet var textPrice: UITextField!
    @IBOutlet var buttonTotal: UIButton!
    @IBOutlet var textTotal: UITextField!
    @IBOutlet var buttonProfit: UIButton!
    @IBOutlet var tabelView: UITableView!
    
    
    var total : Double
    var volume :Double
    var price : Double
    init(volume:Double,price:Double){
        self.volume = volume
        self.price = price
    }
    
    @IBAction func total(sender: AnyObject) {
        total = volume*price
    }
    func tableView(tableview:UITableView!,numberOfRowsInSection section : Int)->Int{
        return
    } //UITableViewDataSource methods
    
    func numberOfSectionInTableView(tableView : UITableView!)->Int{
        return 1
    }
    func tableView(tableView : UITableView!,didSelectRowAtIndexPath indexPath:NSIndexPath!){
        
    }
    
    func tableView(tableView : UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!)->UITableViewCell!{
        var cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
        let volume = [indexPath.row]
        let price = possibleTips[volume]!.price
        let total = possibleTips[volume]!.total
        
        cell.textLabel!.text = "\(volume)%:"
        cell.detailTextLabel!.text = String(format: "volume : $%d,price: $%0.2f", total)
        return cell
        
    }
    
    
    func refreshUI(){
        textVolume.text = String(format: "%0.2f",volume.total)
        textPrice.value = Float(volume.price)
        textTotal.text = " (\(Int(textTotal.value))%)"
       tableView.reloadData()
    }

    @IBAction func profit(sender: AnyObject) {
    
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

