# SocialWallet-iOS-SDK-Demo

## 1) Pre Requisites

- Xcode
- CocoaPods
- Test Merchant Code, API Key and Username/PIN (please email sdk@solitondigital.io to obtain)

## 2) Installation


I) [CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

Install CocoaPods by running following command in Terminal

```bash
$ sudo gem install cocoapods
```

II) Specify SocialWalletSDK into your project's `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

pod 'SocialWalletSDK'
```

III) Then run the following command:

```bash
$ Pod install
```
## 3) Usage

### I) How to make payment
Create a new object SocialWalletSDK and initialise it with api_key, merchant_code, order_id, amount, item_description and production(true for production, false for development).

```swift
import SocialWalletSDK

class ViewController: UIViewController, SocialWalletDelegate  {
    
    @IBAction func requestPayment(_ sender: Any){
        
        let socialWalletVC = SocialWalletSDK()
        
        let order_id = String(describing: UInt64(Date().timeIntervalSince1970))
        
        socialWalletVC.initSDK(api_key: api_key,
                               merchant_code: merchant_code,
                               order_id: order_id,
                               amount: amount,
                               description: item_description,
                               production: production)
        
        socialWalletVC.delegate = self
        
        present(socialWalletVC, animated: true, completion: nil)
        
    }
}
```

### II) How to listen to payment event
Implement SocialWalletDelegate to your view controller. paymentCallback method will be called upon any payment event.

```swift
import SocialWalletSDK

class ViewController: UIViewController, SocialWalletDelegate  {
    
    func paymentCallback(order_id: String, status: String, amount: String, description: String, emoney_txid: String, payment_id: String, request_time: String, user_name: String) {
        
        print("Receive order_id \(order_id)")
        print("Receive status \(status)")
        print("Receive amount \(amount)")
        print("Receive description \(description)")
        print("Receive emoney_txid \(emoney_txid)")
        print("Receive payment_id \(payment_id)")
        print("Receive request_time \(request_time)")
        print("Receive user_name \(user_name)")     
    }
}
```

Status = 2 : Payment successful (Please email sdk@solitondigital.io for complete list of status codes)

## 4) Moving into Production

Please email sdk@solitondigital.io to obtain production Merchant Code and API Key when you are ready to go live
