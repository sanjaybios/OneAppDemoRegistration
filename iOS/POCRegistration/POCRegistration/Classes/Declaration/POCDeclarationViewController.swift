//
//  POCDeclarationViewController.swift
//  POCRegistration
//
//  Created by Sanjay Bhanagade on 05/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class POCDeclarationViewController: UIViewController {
    
    //Variables
    var isCodingGuidelineUnderstood  = false
    var isTermsAccepted = false
    var shouldContact = false
    
    //IBOutlets
    @IBOutlet weak var declarationButton: UIBarButtonItem!
    @IBOutlet weak var finishButton: UIBarButtonItem!
    
    @IBOutlet weak var guidelineUnderstandButton: UIButton! {
    didSet {
            self.guidelineUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        }
    }
    @IBOutlet weak var termUnderstandButton: UIButton! {
        didSet {
            self.termUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        }
    }
    
    @IBOutlet weak var contactPreferenceButton: UIButton! {
        didSet {
            self.contactPreferenceButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        }
    }
    
    @IBOutlet weak var headingLabel: UILabel! {
        didSet {
            self.headingLabel.text = Constants.titleInstruction
        }
    }
    
    @IBOutlet weak var understoodGuidelineLabel: UILabel! {
        didSet {
            self.understoodGuidelineLabel.text = Constants.guidelinesInstruction
        }
    }
    
    @IBOutlet weak var acceptTermsLabel: UILabel! {
        didSet {
            self.acceptTermsLabel.text = Constants.termsAcceptance
        }
    }
    
    @IBOutlet weak var moreDescriptionLabel: UILabel! {
        didSet {
            self.moreDescriptionLabel.text = Constants.lowerDescription
        }
    }
    
    @IBOutlet weak var contactPreferenceLabel: UILabel! {
        didSet {
            self.contactPreferenceLabel.text = Constants.preferences
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
        let loginStoryboard = UIStoryboard.init(name: "LoginStoryboard", bundle: nil)
        let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginVC")
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func understandGuidelines(_ sender: UIButton) {
        if isCodingGuidelineUnderstood {
            isCodingGuidelineUnderstood = false
            self.guidelineUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        } else {
            isCodingGuidelineUnderstood = true
            self.guidelineUnderstandButton.setImage(#imageLiteral(resourceName: "CheckMark"), for: .normal)
        }
    }
    
    @IBAction func acceptTerms(_ sender: Any) {
        if isTermsAccepted {
            isTermsAccepted = false
            self.termUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        } else {
            isTermsAccepted = true
            self.termUnderstandButton.setImage(#imageLiteral(resourceName: "CheckMark"), for: .normal)
        }
    }
    
    @IBAction func contactPreference(_ sender: Any) {
        if shouldContact {
            shouldContact = false
            self.contactPreferenceButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        } else {
            shouldContact = true
            self.contactPreferenceButton.setImage(#imageLiteral(resourceName: "CheckMark"), for: .normal)
        }
    }
}
