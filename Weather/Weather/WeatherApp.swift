//
//  WeatherApp.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import SwiftUI

@main
struct WeatherApp: App {
  let measurementType = MeasurementType(option: .imperial)
  
  var body: some Scene {
    let locationService = LocationService(measurementType: measurementType)
    
    WindowGroup {
      WeatherView(locationService: locationService)
        .environmentObject(measurementType)
    }
  }
}
