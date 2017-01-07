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

public struct FrontpageViewContent: Mappable {
    var title: String?
    var body:  String?
    var contentType: String?
    var date: String?
    var image: String?
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        title     <- map["title"]
        body  <- map["body"]
        contentType <- map["type"]
        date <- map["created"]
        image <- map["field_image"]
    }
}
final class ExampleCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    }


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let urlString = "http://waterwheel-swift.com/frontpage"
    
    
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
        
       tableView.reloadData()
       //print(headlinesArray)
    }
    

    // MARK: - Table view code
    
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
            let imgURL = "http://waterwheel-swift.com" + headline["image"]!
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // load nodeVC
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Node") as? NodeViewController {
            // great success
            let headline = headlinesArray[indexPath.row]

            vc.selectedTitle = headline["title"]
            vc.selectedDate = headline["created"]
            vc.selectedBody = headline["body"]
            
            
            // Setup image
            let imgURL = "http://waterwheel-swift.com" + headline["image"]!
            print("URL STRING BE THIS: \(imgURL)")
            var img: UIImage
            
            let url = NSURL(string: imgURL)
            if let data = NSData(contentsOf: url as! URL) {
                img = UIImage(data: data as Data)!
            } else {
                img = UIImage(named: "photo")!
            }

            vc.selectedImage = img
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

