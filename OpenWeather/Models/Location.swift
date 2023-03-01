//
//  Location.swift
//  OpenWeather
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation

public struct Location: Decodable {
    public var name: String
    public var lat: Double
    public var lon: Double
}
