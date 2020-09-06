//
//  Weather.swift
//  WeatherApp
//
//  Created by Ivan Sliepov on 06.09.2020.
//  Copyright © 2020 Ivan Sliepov. All rights reserved.
//

import Foundation


class Weather {
    
    var finished = false
    var apiLaunched = false
    
    func getTemp(location:String) {
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=376ff8ee4cd1b5d0be4d6aa0b018adf1&units=metric") {
            URLSession.shared.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) in
            
                if error != nil {
                    print("API ERROR!")
                }
                
                else {
                    // print("IT WORKED!")
                    
                    do {
                        if data != nil {
                            let json = try JSON(data: data!)
                            let locationName = json["name"]
                            let temp = json["main"]["temp"]
                            print("Location: \(locationName)")
                            print("Temp: \(temp)°C")
                        }
                    }
                    catch{}
                }
                
            self.finished = true
            }).resume()
        }
        else {
            self.finished = true
        }
            
    }
    
}


