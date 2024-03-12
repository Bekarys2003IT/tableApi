//
//  DAR.swift
//  HometaskTable
//
//  Created by Bekarys Sandigali on 12.03.2024.
//

import Foundation
import Alamofire

struct Dar:Codable {
    var results: [Apis]
}
struct Apis:Codable {
    var name:String
    var height:String
    var mass:String
}
