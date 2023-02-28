//
//  Location.swift
//  OpenWeather
//
//  Created by Jordane HUY on 28/02/2023.
//

import Foundation

public class Location {
    var name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public func test() {
        print("popo \(name)")
    }
}
