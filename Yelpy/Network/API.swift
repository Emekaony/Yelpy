//
//  File.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation


struct API {
    

    
    static func getRestaurants(completion: @escaping ([[String:Any]]?) -> Void) {
        
        // ––––– TODO: Add your own API key!
        let apikey = "V0ZjDqm0LXRtrbLRTDXL-8a6tO_8TjRXa6xbqllrwumvloZdWsdmf58YeWHEn0Nts6C8s7Vun6LB2P97ZIDoVvNGil35_VqMGgL_Q-uH-kdFcBf3C2KN_LP3uM4eY3Yx"
        
        // Coordinates for San Francisco
        let lat = 37.773972
        let long = -122.431297
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
        

                // ––––– TODO: Get data from API and return it using completion
                print(data)
                
                // 1. Convert JSON response into dictionary
                let dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                
                
                return completion([[:]])
                
                }
            }
        
            task.resume()
        
        }
    }

    