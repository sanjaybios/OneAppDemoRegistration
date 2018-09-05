//
//  POCDeclarationViewController.swift
//  POCRegistration
//
//  Created by Sanjay Bhanagade on 05/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class POCDeclarationViewController: UIViewController
{
    
    //IBOutlets
    @IBOutlet weak var declarationButton: UIBarButtonItem!
    @IBOutlet weak var finishButton: UIBarButtonItem!
    @IBOutlet weak var guidelineUnderstandButton: UIButton!
    @IBOutlet weak var termUnderstandButton: UIButton!
    @IBOutlet weak var contactPreferenceButton: UIButton!
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var understoodGuidelineLabel: UILabel!
    @IBOutlet weak var acceptTermsLabel: UILabel!
    @IBOutlet weak var moreDescriptionLabel: UILabel!
    @IBOutlet weak var contactPreferenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setAllLabelText()
        self.guidelineUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        self.termUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        self.contactPreferenceButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: Local Functions
    func setAllLabelText()
    {
        self.headingLabel.text = Constants.titleInstruction
        self.understoodGuidelineLabel.text = Constants.guidelinesInstruction
        self.acceptTermsLabel.text = Constants.termsAcceptance
        self.moreDescriptionLabel.text = Constants.lowerDescription
        self.contactPreferenceLabel.text = Constants.preferences
    }
  
    //MARK: IBActions
    @IBAction func declare(_ sender: Any) {
        
    }
    
    @IBAction func finish(_ sender: Any) {
    }
    
    @IBAction func understandGuidelines(_ sender: UIButton) {
        
    }
    
    @IBAction func acceptTerms(_ sender: Any) {
    }
    
    @IBAction func contactPreference(_ sender: Any) {
    }
}
