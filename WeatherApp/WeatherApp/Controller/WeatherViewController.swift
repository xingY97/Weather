//
//  ViewController.swift
//  WeatherApp
//
//  Created by X Y on 3/31/21.
//

import UIKit
//comform to UITextFiledDelegate to allow to edit textfield
class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherData = WeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        //dismiss keyboard after search pressed
        searchTextField.endEditing(true)
        
        //keep track on the text input
        print(searchTextField.text!)
    }
    
    //triggers go button on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchTextField.endEditing(true)

        print(searchTextField.text!)
        return true
    }
    
    //handles if user deselect textField without entering anything
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Enter a city"
            return false
        }
    }
    
    //clear textField after search button pressed
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherData.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
    
}

