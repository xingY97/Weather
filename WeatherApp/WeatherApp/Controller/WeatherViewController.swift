//
//  ViewController.swift
//  WeatherApp
//
//  Created by X Y on 3/31/21.
//

import UIKit
//comform to UITextFiledDelegate to allow to edit textfield
class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var daysTableView: UITableView!
    
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    let viewModel = WeatherViewModel()
    var weather = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the Viewcontroller as the datasource and delegate of the tableview
        daysTableView.delegate = self
        daysTableView.dataSource = self
        
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

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weather.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "days", for: indexPath)
        //return the cell
        return cell
    }
    
    
    
}
