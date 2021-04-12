//
//  Forecast.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import Foundation

struct ForecastResponse: Codable {
  let DailyForecasts: [Forecast]
}

struct Forecast: Codable, Identifiable {
  var id: String? = UUID().uuidString
  let Date: String
  let Temperature: Temperature
  let Day: WeatherPhrase
  let Night: WeatherPhrase
  
  struct Temperature: Codable {
    let Minimum: TemperatureValue
    let Maximum: TemperatureValue
  }
  
  struct WeatherPhrase: Codable {
    let IconPhrase: String
  }
}

extension Forecast {
  static func mock() -> Forecast {
    return Forecast(Date: "2020-11-23T07:00:00-08:00",
                    Temperature: Forecast.Temperature(Minimum: TemperatureValue(Value: 71, Unit: "F"),
                                                      Maximum: TemperatureValue(Value: 86, Unit: "F")),
                    Day: .init(IconPhrase: "Partly Sunny"),
                    Night: .init(IconPhrase: "Partly Cloudy"))
  }
}
