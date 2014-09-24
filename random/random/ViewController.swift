//
//  ViewController.swift
//  random
//
//  Created by Student on 9/24/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var One: UIButton!
    @IBOutlet var Two: UIButton!
    @IBOutlet var Three: UIButton!
    
    var a=0
    var b=0
    var c=0
    
    @IBOutlet var onelabel: UILabel!
    @IBOutlet var twolabel: UILabel!
    @IBOutlet var threelabel: UILabel!
    
    @IBOutlet var resetButton: UIButton!
    
    @IBAction func one(sender: AnyObject) {
        a=a+1
        
        onelabel.text = String(a)
    }
    
    @IBAction func two(sender: AnyObject) {
        b=b+1
        
        twolabel.text = String(b)
    }
    @IBAction func three(sender: AnyObject) {
        c=c+1
        
        threelabel.text = String(c)
    }
    @IBAction func set (sender: AnyObject) {
       a=0
       b=0
       c=0
        onelabel.text = String(a)
        twolabel.text = String(b)
        threelabel.text = String(c)
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

