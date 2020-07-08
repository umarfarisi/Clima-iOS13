//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by muhammad.farisi on 08/07/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func updateView(_ model: WeatherModel)
    func didFail(with error: Error)
}
