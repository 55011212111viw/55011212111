//
//  ViewController.swift
//  Exam1_55011212111
//
//  Created by student on 12/17/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource{
    
   var items = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableview:UITableView,numberOfRowsInSection section:Int)->Int{
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableHeaderFooterViewWithIdentifier ("Cell") as UITableViewCell
        Cell.textLabel!.text = items[indexPath.row]
        return Cell
        
    }
   
    @IBAction func addItems(sender: AnyObject) {
        var alert = UIAlertController(title: "New items", message: "Add a new Name", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){(action:UIAlertAction!)->Void in
            
            let textField = alert.textFields![0] as UITextField
            self.items.append(textField.text)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){(ACTION : UIAlertAction!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!)-> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,animated: true,completion: nil)

    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Stocks\""
        tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier:"Cell")

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

