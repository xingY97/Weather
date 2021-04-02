//
//  WeatherTempData.swift
//  WeatherApp
//
//  Created by X Y on 3/31/21.
//

//day name, weather icon, description, city
struct WeatherTempData: Codable {
    let main: Main
    let weather: [Weather]
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
}

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}
