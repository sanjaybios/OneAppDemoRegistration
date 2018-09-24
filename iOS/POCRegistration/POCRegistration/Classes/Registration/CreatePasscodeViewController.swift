//
//  CreatePasscodeViewController.swift
//  POCRegistration
//
//  Created by Monica on 11/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class CreatePasscodeViewController: UIViewController {

    @IBOutlet weak var enterPasscodeTextField: UITextField!
    @IBOutlet weak var reEnterPasscodeTextfield: UITextField!
    
    var passcode: String = ""
    var reEnterPasscode: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
}

//MARK: - UITextFieldDelegate Methods
extension CreatePasscodeViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        var characterCount = textField.text?.count ?? 0
        characterCount = characterCount + string.count
        
        if characterCount > 5 {
            return false
        }
        
        return true
    }
}
