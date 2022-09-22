//
//  WeatherRequest.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 21/09/2022.
//

import Foundation
import CoreLocation

struct WeatherRequest : Encodable {
    let location: String
    let period: String
}
