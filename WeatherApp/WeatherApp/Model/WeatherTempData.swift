//
//  WeatherTempData.swift
//  WeatherApp
//
//  Created by X Y on 3/31/21.
//

//day name, weather icon, description, city
import Foundation

struct WeatherTempData: Decodable {
    
    let name: String
    let main: Main
    let weather: [Weather]

}

struct Main: Decodable {
    
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
