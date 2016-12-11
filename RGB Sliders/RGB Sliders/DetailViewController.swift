//
//  DetailViewController.swift
//  RGB Sliders
//
//  Created by Patrick Donahue on 12/11/16.
//  Copyright © 2016 Patrick Donahue. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var backgroundSwitch: UISwitch!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesLabel: UILabel!
    
    let defaults = UserDefaults.standard

    var currentBackgroundColor = UIColor()
    
    var red: CGFloat = 1.0
    var green: CGFloat = 1.0
    var blue: CGFloat = 1.0
    
    override func viewDidLoad() {
        
        self.currentBackgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: 1)
        
        self.red = CGFloat(defaults.float(forKey: "red"))
        self.green = CGFloat(defaults.float(forKey: "green"))
        self.blue = CGFloat(defaults.float(forKey: "blue"))
        
        self.backgroundSwitch.isOn = defaults.bool(forKey: "switch")
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeTextColor()
    }
    
    @IBAction func turnOffBackgroundColor(_ sender: Any)
    {
        changeTextColor()
        if (backgroundSwitch.isOn == false)
        {
            self.view.backgroundColor = UIColor.white
            noLabel.textColor = UIColor.black
            yesLabel.textColor = UIColor.black
            questionLabel.textColor = UIColor.black
            defaults.set(false, forKey: "switch")
        } else {
            self.view.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: 1)
            changeTextColor()
            defaults.set(true, forKey: "switch")
        }
    }
    
    func changeTextColor()
    {
        if(currentBackgroundColor == UIColor.black || currentBackgroundColor == UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        {
            noLabel.textColor = UIColor.white
            yesLabel.textColor = UIColor.white
            questionLabel.textColor = UIColor.white
        }
    }
}
