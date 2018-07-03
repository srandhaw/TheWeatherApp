//
//  Constants.swift
//  TheWeatherApp
//
//  Created by Sehajbir Randhawa on 6/26/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LON  = "&lon="
let CNT = "&cnt=10"
let APP_ID = "&appid="
let API_KEY = "42a1771a0b787bf12e734ada0cfc80cb"
let FINAL_URL  = "\(BASE_URL)\(LAT)\(Location.instance.latitude!)\(LON)\(Location.instance.longitude!)\(APP_ID)\(API_KEY)"


typealias CompletionHandler = (_ Success: Bool)->()



let DAILY_BASE_URL = "https://api.openweathermap.org/data/2.5/forecast/daily?"

let DAILY_FINAL_URL = "\(DAILY_BASE_URL)\(LAT)\(Location.instance.latitude!)\(LON)\(Location.instance.longitude!)\(CNT)\(APP_ID)\(API_KEY)"



