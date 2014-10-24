//
//  ColorTwoViewController.swift
//  24102557
//
//  Created by student on 10/24/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
protocol ColorTwoViewControllerDelegate{
    func myVCDidFinish(ColorTwoViewController,text:String)
}

class ColorTwoViewController: UIViewController {
    
    var delegate:ColorTwoViewControllerDelegate? = nil
    
    var colorString = ""
    
    @IBOutlet weak var titlelabel: UINavigationBar!
    
    @IBOutlet weak var Colorlabel: UILabel!
    @IBAction func saveColor(sender: UIBarButtonItem) {
        if(delegate != nil){
            delegate!.myVCDidFinish(self, text: Colorlabel!.text!)
        }
        
    }
   
    @IBAction func colorSelectionButton(sender: UIButton) {
        Colorlabel.text = sender.titleLabel?.text
        if (sender.titleLabel!.text! == "Red"){
            Colorlabel.backgroundColor = UIColor.redColor()}
        else if (sender.titleLabel!.text! == "Green"){
            Colorlabel.backgroundColor = UIColor.greenColor()}
        else if(sender.titleLabel!.text! == "Blue"){
             Colorlabel.backgroundColor = UIColor.blueColor()}
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Colorlabel.text = colorString
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
