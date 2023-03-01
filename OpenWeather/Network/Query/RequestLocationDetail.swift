//
//  RequestLocationDetail.swift
//  OpenWeather
//
//  Created by Jordane HUY on 01/03/2023.
//

import Foundation

struct RequestLocationDetail: DataRequest {
    
    private let apiKey: String = "8a3b894cf83c7a2f9cb3ed93c7d6fd0e"

    var url: String {
        let baseURL: String = "http://api.openweathermap.org/data/2.5"
        let path: String = "/weather"
        return baseURL + path
    }
    
    var queryItems: [String : String] = [:]
    
    var method: HttpMethod {
        .get
    }
    
    init(location: Location) {
        queryItems = ["lat": String(location.lat),
                      "lon": String(location.lon),
                      "appid": apiKey]
    }
    
    func decode(_ data: Data) throws -> LocationDetail {
        let decoder = JSONDecoder()
        let str = String(decoding: data, as: UTF8.self)

        let response = try decoder.decode(LocationDetail.self, from: data)
        return response
    }
}
