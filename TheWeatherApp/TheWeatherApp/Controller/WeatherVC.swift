//
//  WeatherVC.swift
//  TheWeatherApp
//
//  Created by Sehajbir Randhawa on 6/22/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    
    
    static var instance = WeatherVC()
    
    //Variables
    var coordinatesFound = false
    
    //Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
       
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        locationAuthStatus()
        }
        
    
    
    func locationAuthStatus(){
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse){
            currentLocation = locationManager.location
            
            Location.instance.longitude = currentLocation.coordinate.longitude
            Location.instance.latitude = currentLocation.coordinate.latitude
            
            print(Location.instance.latitude, Location.instance.longitude)
            
            updateUI(lat: Location.instance.latitude, lon: Location.instance.longitude)
        }else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
}
}
    
    func updateUI(lat: Double,lon: Double){
        
        MainViewData.instance.downloadData { (success) in
            if(success){
                self.dateLabel.text = MainViewData.instance._date
                self.currentTempLabel.text = "\(MainViewData.instance.currentTemp!)"
                self.locationLabel.text = MainViewData.instance.cityName
                self.currentWeatherType.text = MainViewData.instance.weatherType
                self.currentWeatherImage.image = UIImage(named: MainViewData.instance.weatherType!)
                
                
            }
        }
        
        DataService.instance.downloadData { (success) in
            if(success){
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    //tableView functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.weatherData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell{
           let data = DataService.instance.weatherData[indexPath.row]
            cell.updateView(weatherData: data)
            return cell
            
        }
        //else{
        return UITableViewCell()
        //}
    }

    

}





