//
//  ViewController.swift
//  weatherAppPractice
//
//  Created by X Y on 4/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = WeatherModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the weatherdata from the model
        model.delegate = self
        model.getWeather()
    }


}

extension ViewController: WeatherModelProtocol {
    
    // MARK: - Weather Model Protocol Methods
    
    func WeatherDataRetrieved(_ weatherData: [WeatherManager]) {
        print("Weather data returned from model")
    }
}
