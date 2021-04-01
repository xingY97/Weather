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
    
    let viewModel = WeatherViewModel()
    
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
    
    //clear textField after search button pressed
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            viewModel.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
    
}

