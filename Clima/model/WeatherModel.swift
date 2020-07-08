//
//  WeatherModel.swift
//  Clima
//
//  Created by muhammad.farisi on 08/07/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var iconName: String {
        let iconName: String
        switch conditionId {
        case 200..<300:
            iconName = "cloud.bolt" //Thunderstorm
        case 300..<400:
            iconName = "cloud.drizzle" //Drizzle
        case 500..<600:
            iconName = "cloud.rain" //Rain
        case 600..<700:
            iconName = "snow" //Snow
        case 700..<800:
            iconName = "wind" //Atmosphere
        case 800:
            iconName = "sun.max" //Clear
        case 801..<810:
            iconName = "cloud" //Clouds
        default:
            iconName = "clear" //UNKNOWN
        }
        return iconName
    }
    
}
