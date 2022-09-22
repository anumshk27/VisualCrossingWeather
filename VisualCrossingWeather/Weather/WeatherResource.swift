//
//  WeatherResource.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 21/09/2022.
//

//Repository

import Foundation

struct WeatherResource {
    
    func getWeather(request: WeatherRequest, completionHandler: @escaping(_ result: WeatherResponse) -> Void){
        let period = request.period
        let location = request.location
        let urlQuery = "\(location)/\(period)".filter {!$0.isWhitespace}
        let requestURL = URL(string: API.baseURL + "VisualCrossingWebServices/rest/services/timeline/\(urlQuery)?key=\(API.API_KEY)")
        let manager = APIManager()
        do {
            manager.getApiData(requestUrl: requestURL!,
                                   resultType: WeatherResponse.self) { response in
                _ = completionHandler(response!)
            }
        }
    }
}
