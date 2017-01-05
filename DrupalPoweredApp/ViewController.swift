//
//  ViewController.swift
//  DrupalPoweredApp
//
//  Created by Kevin Colligan on 1/5/17.
//  Copyright © 2017 Kevin Colligan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Temp data. Will get from Drupal soon
    var headlineImages = ["http://waterwheel-swift.com/sites/default/files/styles/large/public/2017-01/udontsay.jpg", "http://waterwheel-swift.com/sites/default/files/styles/large/public/2017-01/trollGuy.jpg"]
    
    var headlineTitles = ["BE WARNED!", "Waterwheel.swift: Drupal for Swift developers"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlineImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HeadlineCell {
            
            var img: UIImage!
            
            let url = NSURL(string: headlineImages[indexPath.row])
            if let data = NSData(contentsOf: url as! URL) {
                img = UIImage(data: data as Data)
            } else {
                img = UIImage(named: "photo")
            }
            
            cell.configureCell(image: img, text: headlineTitles[indexPath.row])
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

