//
//  WeatherVIiewModel.swift
//  WeatherApp
//
//  Created by X Y on 4/1/21.
//

import Foundation

class WeatherViewModel {
    
    let baseUrl = "https://api.openweathermap.org/data/2.5/forecast?"
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(baseUrl)&q=\(cityName)&appid=9658f91424a20230f084ae61132c2327"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //Create a URL
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let response = response {
                        print(response)
                    }
                    if let data = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            print(json)
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
        }
    }
    
    func parseJSON(weatherTempData: Data) {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherTempData.self, from: weatherTempData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
    
}
