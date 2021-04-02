//
//  WeatherModel.swift
//  weatherAppPractice
//
//  Created by X Y on 4/1/21.
//

import Foundation

protocol WeatherModelProtocol {
    
    func WeatherDataRetrieved(_ weatherData:[WeatherManager] )
    
}

class WeatherModel {
    
    var delegate: WeatherModelProtocol?
    
    
    func getWeather() {
        
        //Fire off the request to the API
        
        //Create a string URL
        let stringUrl = "http://api.openweathermap.org/data/2.5/forecast?&q=Towson&appid=9658f91424a20230f084ae61132c2327"
        
        //Create a URL object
        let url = URL(string: stringUrl)
        //check that it isn't nil
        guard url != nil  else {
            print("Couldn't create url object")
            return
        }
        //Get the URL session
        let session = URLSession.shared
        
        //Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                //Attemp to parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    
                    // Parse the json into WeatherManager
                    let weatherManager = try decoder.decode(WeatherManager.self, from: data!)
                    
                    let weatherData = weatherManager.weathers!
                    
                    //pass it back to the view controller in the mian thread
                    DispatchQueue.main.async {
                        self.delegate?.WeatherDataRetrieved(weatherData)
                    }
                    
                }
                catch {
                    
                    print("Error parsing the json")
                } // End Do - Catch
                
                
            }// End if
            
        }// End Data Task 
        //Start the data task
        dataTask.resume()
    }
}
