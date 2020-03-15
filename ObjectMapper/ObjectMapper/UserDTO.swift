//
//  UserDTO.swift
//  ObjectMapper
//
//  Created by shin seunghyun on 2020/03/08.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserDTO: Mappable {
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        age <- map["age"]
        city <- map["city"]
    }
    
    var name: John?
    var age: Int?
    var city: String?
    
    struct John: Mappable {
        
        var john: String?
        
        init?(map: Map) {
            
        }
        
        mutating func mapping(map: Map) {
            john <- map["john"]
        }
        
        
    }
    
}
