//
//  ViewController.swift
//  ObjectMapper
//
//  Created by shin seunghyun on 2020/03/08.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var json_str =
        """
{"name": {"john": "Father"}, "age": 31, "city":"New York"}
"""
        
        var userDTO = UserDTO(JSONString: json_str)
        
        print(userDTO?.name?.john)
        print(userDTO?.age)
        print(userDTO?.city)
    }
    
    
    
}

