//
//  WeatherVC+CollectionView.swift
//  VisualCrossingWeather
//
//  Created by MuhammadAnum on 21/09/2022.
//

import Foundation
import UIKit

extension WeatherViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: WeatherCell = tableView.dequeue(cellForRowAt: indexPath) as WeatherCell
        let weather = weather[indexPath.row]
        cell.configureWeatherCell(weatherData: weather)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
