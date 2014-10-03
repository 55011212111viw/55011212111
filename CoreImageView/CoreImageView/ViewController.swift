//
//  ViewController.swift
//  CoreImageView
//
//  Created by student on 10/3/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    var context: CIContext!
    var filter: CIFilter!
    var beginImage: CIImage!
    var orientation: UIImageOrientation! = .Up //new
    
    @IBOutlet weak var UIImageCview: UIImageView!
    @IBOutlet weak var amountSlider: UISlider!
    
    @IBAction func mountSliderValueChanged(sender: UISlider) {
        let slidervalue = sender.value
        
        let outputImage = self.oldPhoto(beginImage,withAmount:slidervalue)
        
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        let newImage = UIImage(CGImage: cgimg,scale:1,orientation:orientation)
        self.imageView.image = newImage
    }
    
   func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:NSDictionary!){
    
    self.dismissViewControllerAnimated(TRUE, completion: nil);
    
    let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
    
    beginImage = CIImage(image:gotImage)
    orientation = gotImage.imageOrientation
    filter.setValue(beginImage, forKey: kCIInputImageKey)
    self.amountSliderValueChanged(amountSlider)
    }
    
    func logAllFilters(){
    let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        println(properties)
        
        for filterName:AnyObject in properties{
            let fltr = CIFilter(name: filterName as String)
            println(fltr.attributes())
        }
    }
    
    func oldPhoto(img : CIImage , withAmount intensity:Float) ->CIImage{
     
        let sepia = CIFilter(name: "CISepiaTone")
        sepia.setValue(img, forKey: kCIInputImageKey)
        sepia.setValue(intensity, forKey: "inputIntensity")
        
        let random = CIFilter(name: "CIRandomGenerrator")
        
        let lighten = CIFilter(name: "CIColorControls")
        lighten.setValue(random.outputImage, forKey: kCIInputImageKey)
        lighten.setValue(1-intensity, forKey:"inputBringhtness")
        lighten.setValue(0, forKey: "inputSaturation")
        
        let croppedImage = lighten.outputImage.imageByCroppingToRect(beginImage.extent())
        
        let composite = CIFilter(name: "CIHardLigthblendMode")
        composite.setValue(sepia.outputImage, forKey:kCIInputImageKey)
        composite.setValue(croppedImage, forKey:kCIInputBackgroundImageKey)
        
        let vignesite = CIFilter(name: "CIVignette")
        vignesite.setValue(composite.outputImage, forKey: kCIInputImageKey)
        vignesite.setValue(intensity*2, forKey: "inputIntensity")
        vignesite.setValue(intensity*30, forKey: "inputRadius")
        
        return vignesite.outputImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = NSBundle.mainBundle().URLForResource("image", withExtension: "png")
        
        beginImage = CIImage(contentsOfURL: fileURL)
        
        filter = CIFilter(name: "CISepiaTone")
        filter.setValue(beginImage,forkey:kCIInputImageKey)
        filter.setValue(0.5,forkey:kCIInputIntensityKey)
        let outputImage = filter.outputImage
        
        context = CIContext(options: nil)
        let cgimg = context.createCGImage(outputImage,fromRect:outputImage.extent())
        
        let newImage = UIImage(CGImage: cgimg)
        self.imageView.image = newImage
        
        self.logAllFilters()
    }

    @IBAction func savePhoto(sender: AnyObject) {
        let imageToSave = filter.outputImage
        
        let softwereContext = CIContext(options: [kCIContextUseSoftwareRenderer:true])
        
        let cgimg = softwereContext.createCGImage(imageToSave, fromRect: imageToSave.extent())
        
        let library =ALAssetsLibrary()
        library.writeImageToSavedPhotoAlbum(cgimg,metadata:imageToSave.properties(),completionBlock:nil)
    }
    @IBAction func loadPhoto(sender: AnyObject) {
        let pickerC = UIImagePickerController()
        pickerC.delegate = self
        self.presentViewController(pickerC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

