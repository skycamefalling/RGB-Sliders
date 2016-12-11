//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Patrick Donahue on 12/8/16.
//  Copyright © 2016 Patrick Donahue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorSquare: UIView!
    
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.borderWidth = 1
        
        redSlider.value = defaults.float(forKey: "red")
        greenSlider.value = defaults.float(forKey: "green")
        blueSlider.value = defaults.float(forKey: "blue")
        
        changeBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeBackgroundColor()
    {
        let red = CGFloat(self.redSlider.value)
        let green = CGFloat(self.greenSlider.value)
        let blue = CGFloat(self.blueSlider.value)
        
        self.colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        defaults.set(redSlider.value, forKey: "red")
        defaults.set(greenSlider.value, forKey: "green")
        defaults.set(blueSlider.value, forKey: "blue")
        defaults.synchronize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openColor")
        {
            let newViewController = segue.destination
            if(defaults.bool(forKey: "switch") == true)
            {
                newViewController.view.backgroundColor = colorSquare.backgroundColor
            } else {
                newViewController.view.backgroundColor = UIColor.white
            }
        }
    }

}

