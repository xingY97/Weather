//
//  WeatherData.swift
//  WeatherApp
//
//  Created by X Y on 3/31/21.
//

import Foundation

struct WeatherData {
    
    let weatherURL = "http://api.openweathermap.org/data/2.5/forecast?id={2275099}&appid=9658f91424a20230f084ae61132c2327&&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
}
