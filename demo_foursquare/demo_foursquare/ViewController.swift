//
//  ViewController.swift
//  demo_foursquare
//
//  Created by iMac 2017 21.5" Retina 4K on 21/11/2562 BE.
//  Copyright © 2562 iMac 2017 21.5" Retina 4K. All rights reserved.
//

import UIKit
struct Course: Decodable {
    var id : Int
    var name : String
    var link : String
    var imageUrl : String
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//
//    }

}

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPlace()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func currentDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMDD"
        let result = formatter.string(from: date)
        return result
    }
    func getPlace() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMDD"
        let result = formatter.string(from: date)
        let client_id = "DSSIAPPQ4LSR40XNXZXJQNHGU0NSNFC5YEJYKIHJTSY0QX2E"
        let client_secret = "PL3ICK2DMR4OXDQ1T5ODZ4R255SA00B3TDUQRJUK4ICZL5CX"
               
        let jsonUrl = "https://api.foursquare.com/v2/venues/explore?near=cnx&client_id=\(client_id)&client_secret=\(client_secret)&v=\(result)"
        guard let url = URL(string: jsonUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do {
                let result = try JSONDecoder().decode(responseInfo.self, from: data)
                print(result.response)
            } catch {
              print("show sth",err)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlaceTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

