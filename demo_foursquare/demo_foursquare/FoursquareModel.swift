//
//  FoursquareModel.swift
//  demo_foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 22/11/2562 BE.
//  Copyright © 2562 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import Foundation

struct responseInfo: Decodable {
    var response: groupInfo
}
struct groupInfo: Decodable {
    var group: [itemInfo]
}
struct itemInfo: Decodable {
    var item: [venueInfo]
}
struct venueInfo: Decodable {
    var name: String
    var location: locationInfo
}
struct locationInfo: Decodable {
    var formattedAddress = [String]()
}


