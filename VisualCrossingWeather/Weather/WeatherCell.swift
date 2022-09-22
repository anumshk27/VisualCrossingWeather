//
//  CollectionCell.swift
//  CollectionView
//
//  Created by Mobark Alseif on 11/04/1443 AH.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var wind_avg: UILabel!
    @IBOutlet weak var wind_median: UILabel!
    @IBOutlet weak var temp_avg: UILabel!
    @IBOutlet weak var temp_median: UILabel!

    
    func configureWeatherCell(weatherData: Weather) {
        city.text = weatherData.city
        wind_avg.text =  String(format: "%.1f", weatherData.wind_avg)
        wind_median.text = String(format: "%.1f", weatherData.wind_median)
        temp_avg.text = String(format: "%.1f", weatherData.temp_avg)
        temp_median.text = String(format: "%.1f", weatherData.temp_median)
    }
    
    
    override func awakeFromNib() {
        
        self.backgroundColor = .white
    }
    
}



