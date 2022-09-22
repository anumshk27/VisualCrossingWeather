//
//  WeatherResponse.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 21/09/2022.
//

import Foundation

// MARK: - Welcome
struct WeatherResponse: Codable {
    var days: [CurrentConditions]
}

// MARK: - CurrentConditions
struct CurrentConditions: Codable {
    var temp: Double
    var windspeed: Double
}

/*
enum Conditions: String, Codable {
    case clear = "Clear"
}

// MARK: - Hour
struct Hour: Codable {
    var datetime: String
    var datetimeEpoch: Int
    var temp, feelslike, humidity, dew: Double
    var precip, precipprob, snow, snowdepth: Int
    var preciptype: Int
    var windgust, windspeed, winddir: Double
    var pressure, visibility, cloudcover, solarradiation: Int
    var solarenergy: Double
    var uvindex, severerisk: Int
    var conditions: Conditions
    var icon: Icon
    //var stations: StationsUnion
    var source: Source
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
}

enum Source: String, Codable {
    case fcst = "fcst"
    case obs = "obs"
}



enum StationsUnion: Codable {
    case enumArray([Station])
    case integer(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode([Station].self) {
            self = .enumArray(x)
            return
        }
        throw DecodingError.typeMismatch(StationsUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for StationsUnion"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumArray(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}

enum Station: String, Codable {
    case remote = "remote"
}

// MARK: - StationsClass
struct StationsClass: Codable {
    var f4270: F4270
    
    enum CodingKeys: String, CodingKey {
        case f4270 = "F4270"
    }
}

// MARK: - F4270
struct F4270: Codable {
    var distance: Int
    var latitude, longitude: Double
    var useCount: Int
    var id, name: String
    var quality, contribution: Int
}
*/

