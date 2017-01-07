//
//  NodeViewController.swift
//  DrupalPoweredApp
//
//  Created by Kevin Colligan on 1/6/17.
//  Copyright © 2017 Kevin Colligan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import waterwheel
import ObjectMapper

class NodeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    
    var selectedTitle: String?
    var selectedImage: UIImage?
    var selectedDate: String?
    var selectedBody: String?
    
    open var object : FrontpageViewContent!
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
//        if let imageToLoad = selectedImage {
//            imageView.image = UIImage(named: imageToLoad)
//            print("MADE IT HERE")
//            
//        }
        
        // Do any additional setup after loading the view.
          self.labelTitle.text = selectedTitle
          self.labelDate.text = selectedDate
          self.labelBody.text = selectedBody
          self.imageView.image = selectedImage
        
    }
    
//    override open func viewDidAppear(_ animated: Bool) {
//        Alamofire.request(waterwheelManager.sharedInstance.URL+object.image!).responseImage { response in
//            if let image = response.result.value {
//                self.imageView.image = image
//            }
//        }
//    }
    

}
