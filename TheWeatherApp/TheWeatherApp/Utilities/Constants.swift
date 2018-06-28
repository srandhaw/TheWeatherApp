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
let APP_ID = "&appid="
let API_KEY = "cbb65e3ffbec5c66d3da2cb92cc12755"
let FINAL_URL  = "\(BASE_URL)\(LAT)39\(LON)-86\(APP_ID)\(API_KEY)"
typealias CompletionHandler = (_ Success: Bool)->()
