//
//  OpenWeatherQuery.swift
//  OpenWeather
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation

public class OpenWeatherQuery {
    private let openWeatherService = OpenWeatherService()
    
    public init() {}
    
    public func requestCity(location: String,completion: @escaping (Result<[Location], Error>) -> Void) {
        openWeatherService.request(RequestLocation(searchLocation: location)) { result in
            completion(result)
        }
    }
}
