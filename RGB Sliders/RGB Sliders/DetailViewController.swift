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
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        self.red = CGFloat(defaults.float(forKey: "red"))
        self.green = CGFloat(defaults.float(forKey: "green"))
        self.blue = CGFloat(defaults.float(forKey: "blue"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeTextColor()
    }
    
    @IBAction func turnOffBackgroundColor(_ sender: Any)
    {
        changeTextColor()
        if (!backgroundSwitch.isOn)
        {
           self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            noLabel.textColor = UIColor.black
            yesLabel.textColor = UIColor.black
            questionLabel.textColor = UIColor.black
        } else {
            self.view.backgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: 1)
            changeTextColor()
        }
    }
    
    func changeTextColor()
    {
        let currentBackgroundColor = UIColor(red: self.red, green: self.green, blue: self.blue, alpha: 1)
        if(currentBackgroundColor == UIColor.black || currentBackgroundColor == UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        {
            noLabel.textColor = UIColor.white
            yesLabel.textColor = UIColor.white
            questionLabel.textColor = UIColor.white
        }
    }
}
