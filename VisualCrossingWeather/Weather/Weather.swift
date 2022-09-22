//
//  Weather.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 22/09/2022.
//

import Foundation


struct Weather : Encodable {
    let city: String
    let wind_avg: Double
    let wind_median: Float
    let temp_avg: Double
    let temp_median: Float
}
