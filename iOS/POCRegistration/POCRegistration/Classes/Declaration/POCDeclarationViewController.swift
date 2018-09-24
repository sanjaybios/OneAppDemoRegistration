//
//  POCDeclarationViewController.swift
//  POCRegistration
//
//  Created by Sanjay Bhanagade on 05/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

struct DeclarationViewConstants {
    static let titleInstruction = "Please read the declaration below and check you're happy with it."
    static let guidelinesInstruction = "I understand how the FSCS guideline protect my account."
    static let termsAcceptance = "I have read the accepted the app terms and conditions and the Declaration."
    static let lowerDescription = "App would like to keep you up-to-date by post, fax, telephone, email or other electronic means with money help, news and customer offers from us. We promise not to bombard you. Tick below if you'd rather we didn't do this."
    static let preferences = "I'd prefer not to be contacted thanks."
    
    static let loginStoryboardName = "LoginStoryboard"
    static let loginViewConrollerIdentifier = "LoginViewController"

    static let untickImageName = "Square"
    static let tickImageName = "CheckMark"
}

class POCDeclarationViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var declarationButton: UIBarButtonItem!
    @IBOutlet weak var finishButton: UIBarButtonItem!
    
    @IBOutlet weak var guidelineUnderstandButton: UIButton! {
    didSet {
            self.guidelineUnderstandButton.setImage(UIImage(named: DeclarationViewConstants.untickImageName), for: .normal)
        self.guidelineUnderstandButton.setImage(UIImage(named: DeclarationViewConstants.tickImageName), for: .selected)
        }
    }
    @IBOutlet weak var termUnderstandButton: UIButton! {
        didSet {
            self.termUnderstandButton.setImage(UIImage(named: DeclarationViewConstants.untickImageName), for: .normal)
            self.termUnderstandButton.setImage(UIImage(named: DeclarationViewConstants.tickImageName), for: .selected)
        }
    }
    
    @IBOutlet weak var contactPreferenceButton: UIButton! {
        didSet {
            self.contactPreferenceButton.setImage(UIImage(named: DeclarationViewConstants.untickImageName), for: .normal)
            self.contactPreferenceButton.setImage(UIImage(named: DeclarationViewConstants.tickImageName), for: .selected)
        }
    }
    
    @IBOutlet weak var headingLabel: UILabel! {
        didSet {
            self.headingLabel.text = DeclarationViewConstants.titleInstruction
        }
    }
    
    @IBOutlet weak var understoodGuidelineLabel: UILabel! {
        didSet {
            self.understoodGuidelineLabel.text = DeclarationViewConstants.guidelinesInstruction
        }
    }
    
    @IBOutlet weak var acceptTermsLabel: UILabel! {
        didSet {
            self.acceptTermsLabel.text = DeclarationViewConstants.termsAcceptance
        }
    }
    
    @IBOutlet weak var moreDescriptionLabel: UILabel! {
        didSet {
            self.moreDescriptionLabel.text = DeclarationViewConstants.lowerDescription
        }
    }
    
    @IBOutlet weak var contactPreferenceLabel: UILabel! {
        didSet {
            self.contactPreferenceLabel.text = DeclarationViewConstants.preferences
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: IBActions
    @IBAction func declare(_ sender: Any) {
        
    }
    
    @IBAction func finish(_ sender: Any) {
        let loginStoryboard = UIStoryboard.init(name: DeclarationViewConstants.loginStoryboardName, bundle: nil)
        let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: DeclarationViewConstants.loginViewConrollerIdentifier)
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func understandGuidelines(_ sender: UIButton) {
        if self.guidelineUnderstandButton.isSelected {
            self.guidelineUnderstandButton.isSelected = false
        } else {
            self.guidelineUnderstandButton.isSelected = true
        }
    }
    
    @IBAction func acceptTerms(_ sender: Any) {
        if self.termUnderstandButton.isSelected {
            self.termUnderstandButton.isSelected = false
        } else {
            self.termUnderstandButton.isSelected = true
        }
    }
    
    @IBAction func contactPreference(_ sender: Any) {
        if self.contactPreferenceButton.isSelected {
            self.contactPreferenceButton.isSelected = false
        } else {
            self.contactPreferenceButton.isSelected = true
        }
    }
}
