//
//  WeatherViewModel.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 21/09/2022.
//

import Foundation
import UIKit

protocol WeatherViewModelDelegate {
    func didReceiveResponse(response : WeatherResponse)
}

struct WeatherViewModel {
    
    var delegate : WeatherViewModelDelegate?
    
    func getWeather(request: WeatherRequest){
        let resource = WeatherResource()
        resource.getWeather(request: request) { response in
            UserDefaults.last_fetch = Global.getToday()
            DispatchQueue.main.async {
                self.delegate?.didReceiveResponse(response: response)
            }
        }
    }
}
