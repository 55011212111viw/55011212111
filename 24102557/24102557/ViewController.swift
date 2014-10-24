//
//  ViewController.swift
//  24102557
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ColorTwoViewControllerDelegate {

    @IBOutlet weak var Colorlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func myVCDidFinish(Controller: ColorTwoViewController, text: String) {
        Colorlabel.text = "Co : " + text
        Controller.navigationController?.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue : UIStoryboardSegue, sender : AnyObject!) {
        if segue.identifier == "mySeuge"{
            let vc = segue.destinationViewController as ColorTwoViewController
            vc.colorString = Colorlabel.text!
            vc.delegate = self
        }
        
    }

    

}

