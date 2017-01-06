//
//  ViewController.swift
//  DrupalPoweredApp
//
//  Created by Kevin Colligan on 1/5/17.
//  Copyright © 2017 Kevin Colligan. All rights reserved.
//

import UIKit
import waterwheel
import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    

    let urlString = "http://waterwheel-swift.com/frontpage"
    
    // MARK: - Temp data. Will get from Drupal soon
    // var headlineImages = ["http://waterwheel-swift.com/sites/default/files/styles/large/public/2017-01/udontsay.jpg", "http://waterwheel-swift.com/sites/default/files/styles/large/public/2017-01/trollGuy.jpg"]
    
    // create an array of dictionaries to hold JSON data
    var headlinesArray: [Dictionary<String, String>] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //let urlString = "http://eekcolligandev.prod.acquia-sites.com"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data:data)
                
                parse(json: json)
            }
        }
        
        
     
    }
    
 
    
    func parse(json: JSON) {
        for result in json.arrayValue {
            let created = result["created"].stringValue
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let image = result["field_image"].stringValue
            let obj = ["created": created, "title": title, "body": body, "image": image]
            
            headlinesArray.append(obj)
        }
        
       // tableView.reloadData()
       print(headlinesArray)
    }
    

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlinesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HeadlineCell {
            
           let headline = headlinesArray[indexPath.row]
            cell.mainLbl.text = headline["title"]
            
            // Setup image
            let imgURL = "http://waterwheel-swift.com/" + headline["image"]!
            print("URL STRING BE THIS: \(imgURL)")
            var img: UIImage
            
            let url = NSURL(string: imgURL)
            if let data = NSData(contentsOf: url as! URL) {
                img = UIImage(data: data as Data)!
            } else {
                img = UIImage(named: "photo")!
            }
            
            cell.mainImg.image = img

            
            return cell
        } else {
            return HeadlineCell()
        }
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

