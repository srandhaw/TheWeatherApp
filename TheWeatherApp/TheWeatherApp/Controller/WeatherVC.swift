//
//  WeatherVC.swift
//  TheWeatherApp
//
//  Created by Sehajbir Randhawa on 6/22/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        MainViewData.instance.downloadData { (success) in
            if(success){
                self.dateLabel.text = MainViewData.instance._date
                self.currentTempLabel.text = "\(MainViewData.instance.currentTemp!)"
                self.locationLabel.text = MainViewData.instance.cityName
                self.currentWeatherType.text = MainViewData.instance.weatherType
                self.currentWeatherImage.image = UIImage(named: MainViewData.instance.weatherType!)
                
            }
        }
       
    }
    
    //tableView functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell{
            
            
        }
        return UITableViewCell()
    }

    

}

