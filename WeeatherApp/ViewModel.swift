//
//  ViewModel.swift
//  WeeatherApp
//
//  Created by Adi Amoyal on 09/03/2023.
//

import Foundation
import SwiftUI
import CoreLocation

class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate, WeatherManagerDelegate {
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    @Published var weather: WeatherModel?
    @Published var cityName: String = ""
    
    override init() {
        super.init()
        locationManager.delegate = self
        weatherManager.delegate = self
        requestLocation()
    }
    
    func requestLocation() {
        isLoading = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        isLoading = false
        self.weather = weather
    }
    
    func didFailWithError(error: Error) {
        isLoading = false
        print(error)
    }
    
    func searchPressed() {
        var name = cityName.trimmingCharacters(in: .whitespacesAndNewlines)
        name = name.replacingOccurrences(of: " ", with: "-")
        isLoading = true
        weatherManager.fetchWeather(cityName: name)
        cityName = ""
    }
}
