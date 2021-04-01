////
////  WeatherData.swift
////  WeatherApp
////
////  Created by X Y on 3/31/21.
////
//
//import Foundation
//
//
//struct WeatherData {
//
//    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?id={2275099}&appid=9658f91424a20230f084ae61132c2327&units=metric"
//
//
//
//    func fetchWeather(cityName: String) {
//        let urlString = "\(weatherURL)&q=\(cityName)"
//        performRequest(urlString: urlString)
//    }
//
//    func performRequest(urlString: String) {
//        //Create a URL
//        if let url = URL(string: urlString) {
//
//            //Create a URLsession
//            let session = URLSession(configuration: .default)
//
//            //Give the session a task
//            let task = session.dataTask(with: url) { (data, response, error) in
//                //if there is no error
//                if error != nil {
//                    print(error!)
//                    return
//                }
//
//                //If there are errors
//                if let safeData = data {
//                    self.parseJSON(weatherTempData: safeData)
//                }
//            }
//
//            //Start the task
//            task.resume()
//        }
//    }
//
//    func parseJSON(weatherTempData: Data) {
//        let decoder = JSONDecoder()
//        do{
//            let decodedData = try decoder.decode(WeatherTempData.self, from: weatherTempData)
//            print(decodedData.weather[0].description)
//        } catch {
//            print(error)
//        }
//    }
//}
