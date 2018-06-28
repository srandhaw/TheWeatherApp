//
//  WeatherCell.swift
//  TheWeatherApp
//
//  Created by Sehajbir Randhawa on 6/26/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
     //Outlets
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var tempHigh: UILabel!
    @IBOutlet weak var tempLow: UILabel!
    @IBOutlet weak var sideImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateView(weatherData: WeatherData){
        self.day.text = weatherData.day
        self.weatherType.text = weatherData.weatherType
        self.tempHigh.text = weatherData.tempHigh
        self.tempLow.text = weatherData.tempLow
        self.sideImg.image = UIImage(named: weatherData.sideImg!)

    }

}
