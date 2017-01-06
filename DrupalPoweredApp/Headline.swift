//
//  Headline.swift
//  DrupalPoweredApp
//
//  Created by Kevin Colligan on 1/6/17.
//  Copyright © 2017 Kevin Colligan. All rights reserved.
//

import Foundation

class Headline {
    var title: String
    var image: String
    var body: String
    var date: String
    
    required init?(title: String, image: String, body: String, date: String) {
        self.title = title
        self.image = image
        self.body = body
        self.date = date
    }
    
   
}
