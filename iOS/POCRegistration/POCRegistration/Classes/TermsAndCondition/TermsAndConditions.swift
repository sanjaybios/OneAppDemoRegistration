//
//  TermsAndConditions.swift
//  POCRegistration
//
//  Created by Sanjay Bhanagade on 11/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class TermsAndConditions: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var okButton: UIButton!
    @IBAction func aA(_ sender: UIBarButtonItem) {
    }
    @IBOutlet weak var webView: UIWebView!
    @IBAction func close(_ sender: UIBarButtonItem) {
    }
    @IBAction func cancle(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        self.webView.loadHTMLString("<html><body><br><p>These are the Terms of your Virgin Essential current Account.These Terms,along with our Welcome guide, make up our agreement with you We give you a copy of both of these documents when you open your account.You can also get copies on our website or by calling us.</p><p>Some accounts and services,like the Current Account Switch Service,have additional Terms which also form part of agreement.</p><p>This agreement contains our standard terms and conditions. When you (i) enter your PIN and so request us to activate your SIM on the network; or (ii) open our sealed package; or (iii) use the network other than for emergency calls or calls to our Customer Services department; or (iv) give us authority to debit your nominated bank account; or (v) request a port-in, you will be asking us to give you access to our services and the network on the terms of this agreement. When we accept your request we will connect your SIM to our service and open an account in your name. This will then constitute a binding agreement between us.</p><p>If we agree to deliver anything to you, you must accept delivery personally. We may charge you a delivery fee and if you decide to return the package to us, you may be liable for an administrative fee, depending on your reason for returning the package. The administrative fee will be debited from your account and will be in addition to any fee we may charge for usage of the phone.</p><p>You agree to give us such information about you as we may require and you authorise us to make use of this information in order to open your account, credit check you, debit your bank account or credit card, comply with legislation or provide a better service to you. If you are a business customer you will need to give us business info. You warrant that all information provided to us is and remains true and correct.</p><p>Unless you tell us otherwise, you agree that we can send you promotional and other marketing material in order to keep you posted on special offers and useful information from the Virgin group of companies. If you change your mind about this, you must let us know and we will immediately stop sending you any further marketing material. We may need to send you other important messages, which are not marketing material, such as information about your account, your charges or the network, if required by law or if necessary for us to provide the services to you, whether we have your consent or not.</p></body></html>", baseURL: nil)
        
        webView.scrollView.delegate = self
        
        
    }

   

public func scrollViewDidScroll(_ scrollView: UIScrollView){
    if((scrollView.contentOffset.y>=(scrollView.contentSize.height - scrollView.frame.size.height))){
        okButton.isSelected = true
    }
    else
        {
        okButton.isSelected = false
    }
    
    }
@IBAction func oK(_ sender: UIButton) {
    if(okButton.isSelected==false){
        let alert = UIAlertController(title: "something", message: "Please read all the terms and conditions before you agree", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            // use action here
        })
        self.present(alert, animated: true)
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
