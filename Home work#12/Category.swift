//
//  Category.swift
//  Home work#12
//
//  Created by Mac on 28.12.2021.
//  Copyright © 2021 Mac. All rights reserved.
//

import Foundation

struct Category: Codable {
    var image: String
    var name: String
    var status: String
    var species: String
    var origin: Origin
    var created: String
}
struct Origin: Codable {
    var name: String
    var url: String
}
