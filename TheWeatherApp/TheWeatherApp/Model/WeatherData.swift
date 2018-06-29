//
//  WeatherData.swift
//  TheWeatherApp
//
//  Created by Sehajbir Randhawa on 6/26/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import Foundation

struct WeatherData{
    public private(set) var day: String?
    public private(set) var weatherType: String?
    public private(set) var tempHigh: Double?
    public private(set) var tempLow: Double?
    public private(set) var sideImg: String?
    
    init(day: String, weatherType: String, tempHigh: Double, tempLow: Double, sideImg: String){
        self.day = day
        self.weatherType = weatherType
        self.tempHigh = tempHigh
        self.tempLow = tempLow
        self.sideImg = sideImg
        
    }
    
    
    
}
