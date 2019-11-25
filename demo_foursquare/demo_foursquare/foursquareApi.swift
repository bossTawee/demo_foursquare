//
//  foursquareApi.swift
//  demo_foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 21/11/2562 BE.
//  Copyright © 2562 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper

class foursquareApi {
    
  static func getPlace () {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMDD"
        let result = formatter.string(from: date)
        let client_id = "DSSIAPPQ4LSR40XNXZXJQNHGU0NSNFC5YEJYKIHJTSY0QX2E"
        let client_secret = "PL3ICK2DMR4OXDQ1T5ODZ4R255SA00B3TDUQRJUK4ICZL5CX"
        
        let jsonUrl = "https://api.foursquare.com/v2/venues/explore?near=cnx&client_id=\(client_id)&client_secret=\(client_secret)&v=\(result)"
        guard let url = URL(string: jsonUrl) else {return}
        print(url)
    
    URLSession.shared.dataTask(with: url) { (data, response, err) in
        
        guard let jsonData = data else {return}
        
        let responseStr = String(data: jsonData, encoding: .utf8)
//        print(responseStr)
        
        do {
            let responseData = try JSONDecoder().decode(responseInfo.self, from: jsonData)
            dump(responseData)
        } catch {
            print("err",err)
        }
        
        
        
    }.resume()

    }
    
}
