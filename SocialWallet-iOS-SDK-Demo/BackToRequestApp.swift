//
//  BackToRequestApp.swift
//  SocialWallet-iOS-SDK-Demo
//
//  Created by Alex Leow on 21/11/2017.
//  Copyright © 2017 Soliton Digital Sdn Bhd. All rights reserved.
//

import Foundation
import CallbackURLKit

enum BackToRequestAppError: FailureCallbackError {
    case noText
    
    var code: Int {
        switch self {
        case .noText: return 0
        }
    }
    var message: String {
        switch self {
        case .noText: return "You must defined text parameters"
        }
    }
}

public class BackToRequestApp: Client {
    
    public static let instance = BackToRequestApp()
    
    public init() {
        super.init(urlScheme: "socialwalletsdk-x-callback")
    }
    
    public static let BackToRequestAppActionString = "BackToRequestApp"
    public static let BackToRequestAppAction: ActionHandler = { parameters, success, failed, cancel in
        
        if let text = parameters["text"] {
            
            print("return username \(text)")
            
            
        } else {
            failed(BackToRequestAppError.noText)
        }
    }
    
}
