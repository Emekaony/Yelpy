//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: Array<Dictionary<String, Any>> = []
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 150
        // we call the API as soon as the view loads
        // there must be a much better way to do this, maybe just before the view loads
        getAPIData()
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            // print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData() // reload data!
        }
    }
    
    // protocol stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create Restaurant Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        // set Label to restaurant name for each cell
        cell.label.text = restaurant["name"] as? String ?? ""
        // print(cell.label.text)
        
        // set the image of restaurant
        if let imageURLString = restaurant["image_url"] as? String {
            let imageURL = URL(string: imageURLString)
            cell.restaurantImage.af.setImage(withURL: imageURL!)
        }
        
        return cell
    }

}

// ––––– TODO: Create tableView Extension and TableView Functionality


