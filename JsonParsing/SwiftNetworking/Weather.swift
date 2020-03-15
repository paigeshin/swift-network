//
//  Weather.swift
//  SwiftNetworking
//
//  Created by shin seunghyun on 2020/03/08.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import Foundation

struct Weather {
    
    let summary: String
    let icon: String
    let temperature: Double
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
        
    }
    
    init(json:[String: Any]) throws {
        guard let summary = json["summary"] as? String else { throw SerializationError.missing("Summary is missing") }
        guard let icon = json["icon"] as? String else { throw SerializationError.missing("Icon is missing") }
        guard let temperature = json["temperatureMax"] as? Double else { throw SerializationError.missing("Temp is missing") }
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
    }
    
    static let basePath = "https://api.darksky.net/forecast/f427dee4b909a671bbf55ee1b187b693/"
    
    static func forecast (withLocation location: String, completion: @escaping([Weather]) -> Void) -> Void {
        
        let url = basePath + location
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var forcastArray:[Weather] = []
            
            if let data = data {
                
                do {
                    //Json Mapping
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                        if let dailyForcasts = json["daily"] as? [String: Any] {
                            if let dailyData = dailyForcasts["data"] as? [[String: Any]] {
                                
                                for dataPoint in dailyData {
                                    //Create Weather object
                                    if let weatherObject = try? Weather(json: dataPoint) {
                                        forcastArray.append(weatherObject)
                                    }
                                }
                                
                            }
                        }
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
                
                completion(forcastArray) //return 값
                
            }
            
        }
        
        task.resume()
        
    }
    
}
