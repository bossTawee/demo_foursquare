//
//  FoursquareModel.swift
//  demo_foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 22/11/2562 BE.
//  Copyright © 2562 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import Foundation

struct responseInfo: Decodable {
    var response: responseData
    
}
struct responseData: Decodable {
    var headerFullLocation: String
    var groups: [group]
}

struct group: Decodable {
    var type: String
    var name: String
    var items: [itemData]
    
}
struct itemData: Decodable {
    var venue: venueData
}
struct venueData: Decodable {
    var id: String
    var name: String
    var location: locationData
}
struct locationData: Decodable {
    var formattedAddress: [String]
   
}


