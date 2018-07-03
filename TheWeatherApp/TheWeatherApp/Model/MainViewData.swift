//
//  MainViewData.swift
//  TheWeatherApp
//
//  Created by Sehajbir Randhawa on 6/26/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class MainViewData{
    static let instance = MainViewData()
    
    var date: String?
    var cityName: String?
    var _date: String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self.date = "Today, \(currentDate)"
        return date
    }
    var weatherType: String?
    var currentTemp: Double?
    
    
    func downloadData(completion: @escaping CompletionHandler){
        
        let  url =  URL(string: FINAL_URL)
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if(response.result.error == nil){
                
                 guard let data = response.data else {return}
                do{
                    let json = try JSON(data: data)
                    //print(json)
                    self.cityName  =  json["name"].stringValue
                   self.weatherType = json["weather"][0]["main"].stringValue
                    self.currentTemp = round(json["main"]["temp"].doubleValue - 273.15)
                   
                    
                   
                }catch{}
                
                completion(true)
            }
            else{
                debugPrint(response.result.error!)
            completion(false)
        }
        }
        
    }
    
    
}
