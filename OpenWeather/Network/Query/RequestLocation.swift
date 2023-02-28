//
//  RequestLocation.swift
//  OpenWeather
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation

struct RequestLocation: DataRequest {
    
    private let apiKey: String = "8a3b894cf83c7a2f9cb3ed93c7d6fd0e"

    var url: String {
        let baseURL: String = "http://api.openweathermap.org/geo/1.0"
        let path: String = "/direct"
        return baseURL + path
    }
    
    var queryItems: [String : String] {
        [
            "q": "London",
            "appid": apiKey
        ]
    }
    
    var method: HttpMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> [Location] {
        let decoder = JSONDecoder()
        
        let response = try decoder.decode([Location].self, from: data)
        return response
    }
}
