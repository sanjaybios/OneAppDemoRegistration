//
//  TermsAndConditions.swift
//  POCRegistration
//
//  Created by Sanjay Bhanagade on 11/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
struct TermsAndConditionsConst {
    static let termAndConditonString = "<html><body><p>These are the Terms of your Virgin Essential current Account.These Terms,along with our Welcome guide, make up our agreement with you We give you a copy of both of these documents when you open your account.You can also get copies on our website or by calling us.</p><p>Some accounts and services,like the Current Account Switch Service,have additional Terms which also form part of agreement.</p><p>This agreement contains our standard terms and conditions. When you (i) enter your PIN and so request us to activate your SIM on the network; or (ii) open our sealed package; or (iii) use the network other than for emergency calls or calls to our Customer Services department; or (iv) give us authority to debit your nominated bank account; or (v) request a port-in, you will be asking us to give you access to our services and the network on the terms of this agreement. When we accept your request we will connect your SIM to our service and open an account in your name. This will then constitute a binding agreement between us.</p><p>If we agree to deliver anything to you, you must accept delivery personally. We may charge you a delivery fee and if you decide to return the package to us, you may be liable for an administrative fee, depending on your reason for returning the package. The administrative fee will be debited from your account and will be in addition to any fee we may charge for usage of the phone.</p><p>You agree to give us such information about you as we may require and you authorise us to make use of this information in order to open your account, credit check you, debit your bank account or credit card, comply with legislation or provide a better service to you. If you are a business customer you will need to give us business info. You warrant that all information provided to us is and remains true and correct.</p><p>Unless you tell us otherwise, you agree that we can send you promotional and other marketing material in order to keep you posted on special offers and useful information from the Virgin group of companies. If you change your mind about this, you must let us know and we will immediately stop sending you any further marketing material. We may need to send you other important messages, which are not marketing material, such as information about your account, your charges or the network, if required by law or if necessary for us to provide the services to you, whether we have your consent or not.</p></body></html>"
    static let storyboardId = "createPasscord"
     static let title = "Important"
     static let message = "Please read all the terms and conditions before you agree"
     static let mainStoryboard = "Main"
     static let okTitle = "OK"
     static let cancle = "Cancle"
}

class TermsAndConditions: UIViewController, UIScrollViewDelegate {
    
    private var isScrolledBottom = false
    
      //MARK: IBOutlet
    @IBOutlet weak var okButton: UIButton! {
       didSet {
        okButton.setTitle(TermsAndConditionsConst.okTitle, for: .normal)
    }
    }
    @IBOutlet weak var webView: UIWebView! {
        didSet {
            //provided html content to check scrolling part
            
            self.webView.loadHTMLString (TermsAndConditionsConst.termAndConditonString, baseURL: nil)
            webView.scrollView.delegate = self
        }
    }
    @IBOutlet weak var cancleOutlet: UIButton! {
       didSet {
         cancleOutlet.setTitle(TermsAndConditionsConst.cancle, for: .normal)
        
    }
    }
      //MARK: IBActions
    @IBAction func aA(_ sender: UIBarButtonItem) {
    }

    @IBAction func close(_ sender: UIBarButtonItem) {
    }
    @IBAction func cancle(_ sender: UIButton) {
    }
    @IBAction func oK(_ sender: UIButton) {
        //used to perform action only if the user has read all the terms and conditions
        if self.isScrolledBottom {
            //self.gotoNextScreen()
        } else {
            let alert = UIAlertController(title: TermsAndConditionsConst.title, message: TermsAndConditionsConst.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: TermsAndConditionsConst.okTitle, style: .default) { action in
                // use action here
                self.gotoNextScreen()
            })
            self.present(alert, animated: true)
        }
    }
    
    //MARK: Private Functions
    private func gotoNextScreen() {
        let storyboard = UIStoryboard(name: TermsAndConditionsConst.mainStoryboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: TermsAndConditionsConst.storyboardId)
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    //MARK: ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        
    }
    
    //MARK: scroll View Delegate
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //to check if the scroll view has reached its end
if scrollView.contentOffset.y>=scrollView.contentSize.height - scrollView.frame.size.height {
    self.isScrolledBottom = true
    }
    }
}
