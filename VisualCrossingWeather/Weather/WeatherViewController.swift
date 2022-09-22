//
//  WeatherViewController.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 21/09/2022.
//

import UIKit
import CoreLocation

//import SVProgressHUD

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var changeLocBtn: UIButton!
    @IBOutlet weak var locatePositionBtn: UIButton!
    
    let pickerData = ["Copenhagen, Denmark", "Lodz, Poland", "Brussels, Belgium", "Islamabad, Pakistan"]
    let thePicker = UIPickerView()
    
    var viewModel = WeatherViewModel()
    var weather:[Weather] = []
    
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.setDelegate()
        configureComponents()
        getDefaultCountryWeather()
    }
    
    @IBAction func changeLocation() {
        locationField.becomeFirstResponder()
    }
    
    @IBAction func locateMe() {
        configureLocationManager()
    }
    
    @objc func doneButtonPressed() {
        self.locationField.resignFirstResponder()
        let request = WeatherRequest(location: locationField.text ?? "", period: "last30days")
        self.viewModel.getWeather(request: request)
    }
}

// MARK: Weather view model delegate

extension WeatherViewController: WeatherViewModelDelegate {
    
    func didReceiveResponse(response: WeatherResponse) {
        weather.append(createDataSet(dataSet: response.days))
        self.tableView.reloadData()
    }
}

extension WeatherViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationField.text = pickerData[row]
    }
    
}

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loc = locations.last
        
        let lat = String(format: "%.4f", loc?.coordinate.latitude ?? 0)
        let lon = String(format: "%.4f", loc?.coordinate.longitude ?? 0)
        locationField.text = "\(lat), \(lon)"
        manager.stopUpdatingLocation()
        
        let request = WeatherRequest(location: locationField.text ?? "", period: "last30days")
        self.viewModel.getWeather(request: request)
        
    }

}



