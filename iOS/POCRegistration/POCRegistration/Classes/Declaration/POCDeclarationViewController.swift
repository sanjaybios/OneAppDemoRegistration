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
    {
        didSet
        {
            self.guidelineUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        }
    }
    @IBOutlet weak var termUnderstandButton: UIButton!
    {
        didSet
        {
            self.termUnderstandButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        }
    }
    
    @IBOutlet weak var contactPreferenceButton: UIButton!
    {
        didSet
        {
            self.contactPreferenceButton.setImage(#imageLiteral(resourceName: "Square"), for: .normal)
        }
    }
    
    @IBOutlet weak var headingLabel: UILabel!
    {
        didSet
        {
            self.headingLabel.text = Constants.titleInstruction
        }
    }
    @IBOutlet weak var understoodGuidelineLabel: UILabel!{
        didSet
        {
            self.understoodGuidelineLabel.text = Constants.guidelinesInstruction
        }
    }
    
    @IBOutlet weak var acceptTermsLabel: UILabel!{
        didSet
        {
            self.acceptTermsLabel.text = Constants.termsAcceptance
        }
    }
    
    @IBOutlet weak var moreDescriptionLabel: UILabel!{
        didSet
        {
            self.moreDescriptionLabel.text = Constants.lowerDescription
        }
    }
    
    @IBOutlet weak var contactPreferenceLabel: UILabel!{
        didSet
        {
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
    }
    
    @IBAction func understandGuidelines(_ sender: UIButton) {
        
    }
    
    @IBAction func acceptTerms(_ sender: Any) {
    }
    
    @IBAction func contactPreference(_ sender: Any) {
    }
}
