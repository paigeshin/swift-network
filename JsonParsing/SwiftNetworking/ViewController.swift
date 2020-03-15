//
//  ViewController.swift
//  SwiftNetworking
//
//  Created by shin seunghyun on 2020/03/08.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Weather.forecast(withLocation: "37.8267,-122.4233") { (results: [Weather]) in
            
            for result in results {
                print("\(result)\n\n")
            }
            
        }
        
    }


}

