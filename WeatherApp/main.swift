//
//  main.swift
//  WeatherApp
//
//  Created by Ivan Sliepov on 05.09.2020.
//  Copyright © 2020 Ivan Sliepov. All rights reserved.
//

import Foundation

let weather = Weather()

var location = ""


if CommandLine.arguments.count <= 1 {
    print("You need to provide a location")
    weather.finished = true
}
else {
    for index in 0..<CommandLine.arguments.count {
        if index != 0 {
            location += CommandLine.arguments[index]
        }
    }
}

while !weather.finished {
    
    if !weather.apiLaunched {
        weather.getTemp(location: location)
        weather.apiLaunched = true
    }
    
}
