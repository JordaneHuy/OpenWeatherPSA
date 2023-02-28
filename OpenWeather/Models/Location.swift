//
//  Location.swift
//  OpenWeather
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation

struct Location: Decodable {
    var name: String
    var lat: Double
    var lon: Double
    
    func test() {
        print("popo")
    }
}
