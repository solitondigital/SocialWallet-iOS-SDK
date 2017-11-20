//
//  ViewController.swift
//  SocialWallet-iOS-SDK-Demo
//
//  Created by Alex Leow on 29/06/2017.
//  Copyright © 2017 Soliton Digital Sdn Bhd. All rights reserved.
//

import UIKit
import SocialWalletSDK
import CallbackURLKit

class ViewController: UIViewController, SocialWalletDelegate {
    
    
    //  Please email sdk@solitondigital.io to register for api key and merchant code
    let api_key = ""
    let merchant_code = ""
    var order_id = String(describing: UInt64(Date().timeIntervalSince1970))
    let amount = "1.00"
    let item_description = "Sandisk 32GB Memory Card"
    let socialWalletVC = SocialWalletSDK()
    
    // Change production to true for production use.
    let production = false
    
    func querySocialWalletApp()
    {
        do {
            try GetUserNameCallback.instance.getUsername(
                "getUsername",
                onSuccess:  { parameters in
                    
                    self.socialWalletVC.requestPayment(username: (parameters!["text"] as! String))
                    
            },
                onFailure: { error in
                    
            }
            )
        } catch CallbackURLKitError.appWithSchemeNotInstalled(let scheme) {
            
            // App Store URL.
            let appStoreLink = "https://itunes.apple.com/us/app/social-wallet-my/id1243398893?mt=8"
            
            /* First create a URL, then check whether there is an installed app that can
             open it on the device. */
            if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
                // Attempt to open the URL.
                UIApplication.shared.open(url, options: [:], completionHandler: {(success: Bool) in
                    if success {
                        print("Launching \(url) was successful")
                    }})
            }
            
            
        } catch CallbackURLKitError.callbackURLSchemeNotDefined {
            print("current app scheme not defined")
        } catch let e {
            print("exception \(e)")
        }
        
    }
    
    // This method is call after payment is successfull or any query payment.
    func paymentCallback(order_id: String, status: String, amount: String, description: String, emoney_txid: String, payment_id: String, request_time: String, user_name: String) {
        
        print("Receive order_id \(order_id)")
        print("Receive status \(status)")
        print("Receive amount \(amount)")
        print("Receive description \(description)")
        print("Receive emoney_txid \(emoney_txid)")
        print("Receive payment_id \(payment_id)")
        print("Receive request_time \(request_time)")
        print("Receive user_name \(user_name)")
        
        orderID.text = order_id
        paymentID.text = payment_id
        
        if(status == "2")
        {
            self.status.text = "Successfull payment"
        }
        else
        {
            self.status.text = "Payment error"
        }
        
        paymentView.isHidden = false
        statusView.isHidden = false
        payView.isHidden = true
        continueView.isHidden = false
        
    }
    
    
    @IBOutlet weak var payView: UIStackView!
    @IBOutlet weak var continueView: UIStackView!
    
    @IBOutlet weak var merchantID: UILabel!
    @IBOutlet weak var orderID: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var amountT: UILabel!
    @IBOutlet weak var paymentID: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var paymentView: UIStackView!
    @IBOutlet weak var statusView: UIStackView!
    
    @IBAction func continueShopping(_ sender: Any) {
        
        order_id = String(describing: UInt64(Date().timeIntervalSince1970))
        orderID.text = order_id
        
        payView.isHidden = false
        continueView.isHidden = true
        
    }
    
    @IBAction func requestPayment(_ sender: Any){
        
        socialWalletVC.initSDK(api_key: api_key,
                               merchant_code: merchant_code,
                               order_id: order_id,
                               amount: amount,
                               description: item_description,
                               production: production)
        
        socialWalletVC.delegate = self
        
        present(socialWalletVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        merchantID.text = merchant_code
        orderID.text = order_id
        itemDesc.text = item_description
        amountT.text = amount
        paymentView.isHidden = true
        statusView.isHidden = true
        payView.isHidden = false
        continueView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
