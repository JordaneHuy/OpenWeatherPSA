//
//  LocationDetail.swift
//  OpenWeather
//
//  Created by Jordane HUY on 01/03/2023.
//

import Foundation

public struct LocationDetail: Decodable {
    public var weather: [Weather]
    public var main: MainTemp
}

public struct Weather: Decodable {
    public var main: String
    public var description: String
    public var icon: String
}

public struct MainTemp: Decodable {
    public var temp: Double
    public var feelsLike: Double
    public var tempMin: Double
    public var tempMax: Double
    public var pressure: Double
    public var humidity: Double
    
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}
