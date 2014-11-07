//
//  ViewController.swift
//  testClass1
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let coloredSquare = UIView()
    let duration = 1.0 // ภาพเคลื่อนไหวจะใช้เวลา 1.0 วินาที
    let delay = 0.0 //NSTimeInterval( ((Int(rand()) %  900)+100.0) / 1000.0)
    let options = UIViewAnimationOptions.CurveLinear // การเคลื่นไหวของสี่เหลี่ยม
    let damping = 0.5 // set damping ration
    let velocity = 1.0 // set initial velocity
   
    let size : CGFloat = CGFloat( Int(rand()) %  40 + 20.0)
    let yPosition : CGFloat = CGFloat( Int(rand()) %  200 + 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ใส่สี่เหลี่ยม
        coloredSquare.backgroundColor = UIColor.blueColor()
        
        coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        self.view.addSubview(coloredSquare)
        
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            
            self.coloredSquare.backgroundColor = UIColor.redColor()
            
            // again use the square constants size and yPosition
            self.coloredSquare.frame = CGRectMake(320-self.size, self.yPosition, self.size, self.size)
            
            }, completion: { animationFinished in
                
           self.coloredSquare.removeFromSuperview()
                
        })
  }
    @IBAction func animateButtonPressed(sender: AnyObject) {
//        let coloredSquare = UIView()
//        
//        // เปลี่ยนสีสี่เหลี่ยม
//        coloredSquare.backgroundColor = UIColor.blueColor()
//        coloredSquare.frame = CGRectMake(0, yPosition, size, size)
//        self.view.addSubview(coloredSquare)
//       
//        UIView.animateWithDuration(1.0, animations: {
//            coloredSquare.backgroundColor = UIColor.redColor()
//            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
//            
//        })

        // loop for 10 times
        for loopNumber in 0...10 {
            
            // set up some constants for the animation
            let duration : NSTimeInterval = 1.0
            let delay : NSTimeInterval = 0.0
            let options = UIViewAnimationOptions.CurveLinear
            
            // set up some constants for the fish
            let size : CGFloat = CGFloat( Int(rand()) %  40 + 20.0)
            let yPosition : CGFloat = CGFloat( Int(rand()) %  200 + 20.0)
            
            // create the fish and add it to the screen
            let fish = UIImageView()
            fish.image = UIImage(named: "fish.gif")
            fish.frame = CGRectMake(0, yPosition, size, size)
            self.view.addSubview(fish)
            
            // define the animation
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                
                // move the fish
                fish.frame = CGRectMake(320-size, yPosition, size, size)
                
                }, completion: { animationFinished in
                    
                    // remove the fish
                    fish.removeFromSuperview()
                    
            })
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

