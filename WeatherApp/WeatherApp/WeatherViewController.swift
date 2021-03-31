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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        //keep track on the text input
        print(searchTextField.text!)
    }
    
    //triggers go button on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        return true
    }
    
}

