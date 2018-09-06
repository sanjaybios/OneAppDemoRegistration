//
//  ViewController.swift
//  POCRegistration
//
//  Created by Sanjay Bhanagade on 04/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let titleXPosition = 50
    let titleYPosition = 50
    let titleWidth = 300
    let titleHeight = 30
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // test
        let titleLabel = UILabel(frame: CGRect(x: titleXPosition, y: titleYPosition, width: titleWidth, height: titleHeight))
        titleLabel.text = "Sample Code"
        titleLabel.font = ThemeHelper.Font(key: "ViewController.testTitle.font")!
        titleLabel.textColor = ThemeHelper.Color(key: "ViewController.testTitle.textColor")!
        self.view.addSubview(titleLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

