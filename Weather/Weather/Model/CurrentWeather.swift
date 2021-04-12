//
//  CurrentWeather.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import Foundation

enum IconType: String {
  case sunny
  case partlySunny
  case partlyCloudy
  case rain
  case clear
  case snow
  case unknown
}

struct CurrentWeather: Codable {
  let WeatherText: String
  let IsDayTime: Bool
  let Temperature: TemperatureUnit
  
  struct TemperatureUnit: Codable {
    let Metric: TemperatureValue
    let Imperial: TemperatureValue
  }
}

extension CurrentWeather {
  static func mock() -> CurrentWeather {
    return CurrentWeather(WeatherText: "Mostly Sunny",
                          IsDayTime: true,
                          Temperature: CurrentWeather.TemperatureUnit(Metric: TemperatureValue(Value: 55, Unit: "F"),
                                                                      Imperial: TemperatureValue(Value: 12.8, Unit: "C")))
  }
  
  func temperatureValue(for measurementType: MeasurementType) -> TemperatureValue {
    if measurementType.option == .imperial {
      return self.Temperature.Imperial
    }
    
    return self.Temperature.Metric
  }
}

struct TemperatureValue: Codable {
  let Value: Double
  let Unit: String
}

struct CurrentWeatherHourly: Codable, Identifiable {
  var id: String? = UUID().uuidString
  let DateTime: String
  let IconPhrase: String
  let Temperature: TemperatureValue
  
  var timeStr: String {
    let dateTime = self.toDate(from: self.DateTime)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "ha"
    formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
    
    let hourString = formatter.string(from: dateTime)
    
    return hourString
  }
  
  func toDate(from dateStr: String) -> Date {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    let date = formatter.date(from: String(dateStr.dropLast(6)))
    
    return date ?? Date()
  }
  
  static func mock() -> CurrentWeatherHourly {
    return CurrentWeatherHourly(DateTime: "2020-11-23T07:00:00-08:00",
                               IconPhrase: "Clear",
                               Temperature: TemperatureValue(Value: 52, Unit: "F"))
  }
}
