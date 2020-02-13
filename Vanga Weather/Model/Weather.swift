//
//  Weather.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/11/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import Foundation
 
struct Weather: Codable {
    let weather: [WeatherInfo]
    let main: Main
    let name: String
}

struct WeatherInfo: Codable {
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Float
}





