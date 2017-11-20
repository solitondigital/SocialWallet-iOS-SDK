//
//  GetUserNameCallback.swift
//  SocialWallet-iOS-SDK-Demo
//
//  Created by Alex Leow on 21/11/2017.
//  Copyright © 2017 Soliton Digital Sdn Bhd. All rights reserved.
//

import Foundation
import CallbackURLKit

enum DemoError: FailureCallbackError {
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

open class GetUserNameCallback: Client {
    
    open static let instance = GetUserNameCallback()
    public static let GetUsernameActionString = "getUsername"
    
    public init() {
        super.init(urlScheme: "socialwallet-x-callback")
    }
    
    open func getUsername(_ message: String, onSuccess: SuccessCallback? = nil, onFailure: FailureCallback? = nil, onCancel: CancelCallback? = nil) throws {
        let parameters = ["text": message]
        try self.perform(action: GetUserNameCallback.GetUsernameActionString, parameters: parameters,
                         onSuccess: onSuccess, onFailure: onFailure, onCancel: onCancel)
        
    }
    
}
