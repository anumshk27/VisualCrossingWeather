//
//  WeatherVC+Functions.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 22/09/2022.
//

import Foundation
import CoreLocation
// MARK: functions

extension WeatherViewController  {
    
    func configureLocationManager() {
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func configureComponents() {
        tableView.backgroundColor = .white
        locationField.inputView = thePicker
        locationField.addInputView(target: self, selector: #selector(doneButtonPressed))
        thePicker.delegate = self
    }
    
    func getDefaultCountryWeather() {
        locationField.text = pickerData.last
        
        let isToday = UserDefaults.last_fetch
        if isToday == Global.getToday() {
            guard let weatherData = loadJson() else { return }
            weather.append(createDataSet(dataSet: weatherData))
        }else {
            let request = WeatherRequest(location: locationField.text ?? "", period: "last30days")
            self.viewModel.getWeather(request: request)
        }
    }
    
    func createDataSet(dataSet: [CurrentConditions]) -> Weather {
        let wind = dataSet.map { $0.windspeed }
        let windSum = wind.reduce(0, +)
        let windAvg = windSum / Double(wind.count)
        let medianWind = calculateMedian(array: wind)
        
        let temp = dataSet.map { $0.temp }
        let tempSum = temp.reduce(0, +)
        let tempAvg = tempSum / Double(temp.count)
        let medianTemp = calculateMedian(array: temp)
        
        let weather = Weather(city: locationField.text ?? "",
                              wind_avg: windAvg,
                              wind_median: medianWind,
                              temp_avg: tempAvg,
                              temp_median: medianTemp)
        return weather
    }
    
    func calculateMedian(array: [Double]) -> Float {
        let sorted = array.sorted()
        if sorted.count % 2 == 0 {
            return Float((sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1])) / 2
        } else {
            return Float(sorted[(sorted.count - 1) / 2])
        }
    }
    
    func loadJson() -> [CurrentConditions]? {
        
        if let url = Bundle.main.url(forResource: "response", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(WeatherResponse.self, from: data)
                return jsonData.days
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
