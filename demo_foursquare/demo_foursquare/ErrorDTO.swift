//
//  ErrorDTO.swift
//  demo_foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 22/11/2562 BE.
//  Copyright © 2562 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class ErrorDTO: NSObject , Mappable {
    
    var error: String?
    var message: String?
    
    init(error: String, message: String, hint: String) {
        self.error = error
        self.message = message
    }
    
    init(jsonDict:NSDictionary) {
        error = jsonDict.object(forKey: "error") as? String
        message = jsonDict.object(forKey: "message") as? String
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        error <- map["error"]
        message <- map["message"]
    }
    
}
