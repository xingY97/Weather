//
//  WeatherManager.swift
//  weatherAppPractice
//
//  Created by X Y on 4/1/21.
//

import Foundation

struct WeatherManager : Decodable {
    var name:String?
    var main:Main?
    var weathers: [Weather]?
}

struct Main: Decodable {
    let temp: Double?
}

struct Weather: Decodable {
    let description: String?
    let icon: String?
}

