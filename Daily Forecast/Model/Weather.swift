//
//  Weather.swift
//  Daily Forecast
//
//  Created by Александр on 09.11.2022.
//

import Foundation

struct Weather: Decodable {
    let main: Main
    let weather: [WeatherData]
    let name: String
}

struct Main: Decodable {
    let tempMin: Float
    let tempMax: Float
    let temp: Float
}

struct WeatherData: Decodable {
    let id: Int
    let icon: String
}
