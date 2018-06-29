//
//  DataService.swift
//  TheWeatherApp
//
//  Created by Sehajbir Randhawa on 6/26/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DataService{
    static let instance = DataService()
    
    var weatherData = [WeatherData]()
    
    func downloadData(completion: @escaping CompletionHandler){
        
        let url = URL(string: DAILY_FINAL_URL)
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            
            if(response.result.error  == nil){
                guard let data = response.data else { return }
                
                do{
                    let json = try JSON(data: data)
                    
                    if let array1 =  json["list"].array{
                    
                       for item in array1{
                            
                            let date = item["dt"].doubleValue
                            
                            let unixConvertedDate = Date(timeIntervalSince1970: date)
                            let dateFormatter =  DateFormatter()
                            dateFormatter.dateFormat = "EEEE"
                            dateFormatter.dateStyle = .full
                            dateFormatter.timeStyle = .none
                            
                            let day  =  unixConvertedDate.Dayoftheweek()
                            
                            
                            let weatherType =  item["weather"][0]["main"].stringValue
                            
                            let minTemp  =  round(item["temp"]["min"].doubleValue - 273.15)
                            
                            let maxTemp  =  round(item["temp"]["max"].doubleValue - 273.15)
                            
                            let sideImg  = weatherType
                            
                            let  data  = WeatherData(day: day, weatherType: weatherType, tempHigh: maxTemp, tempLow: minTemp, sideImg: sideImg)
                            
                            self.weatherData.append(data)
                       }
                    }
               }catch{
                
               }
                completion(true)
            }
            else{
                
                completion(false)
            }
        }
        
    }
    
    
}

extension Date{
    func Dayoftheweek() ->  String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
