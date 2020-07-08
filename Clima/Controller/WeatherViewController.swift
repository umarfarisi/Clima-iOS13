//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
    }
    
    @IBAction func onSearchIconClick(_ sender: UIButton) {
        searchBar.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let query = textField.text {
            var weatherManager = WeatherManager()
            weatherManager.delegate = self
            weatherManager.fetchWeather(city: query)
        }
        return true
    }
    
    func updateView(name: String, temp: Double) {
        cityLabel.text = name
        temperatureLabel.text = "\(temp)C"
    }
    
    func updateView(_ model: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = model.cityName
            self.temperatureLabel.text = model.temperatureString
            self.conditionImageView.image = UIImage(systemName: model.iconName)
        }
        
        print("updateView is called with data below")
        print("City name: \(model.cityName)")
        print("Temp: \(model.temperatureString)")
        print("Icon name: \(model.iconName)")
        print("=================================")
    }
    
    func didFail(with error: Error) {
        print(error)
    }


}

