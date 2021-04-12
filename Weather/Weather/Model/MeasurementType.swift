//
//  MeasurementType.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import Foundation

enum MeasurementTypeOption {
  case metric
  case imperial
  
  var unitTemperature: UnitTemperature {
    switch self {
    case .imperial:
      return .fahrenheit
    case .metric:
      return .celsius
    }
  }
}

class MeasurementType: ObservableObject {
  var option: MeasurementTypeOption
  
  init(option: MeasurementTypeOption) {
    self.option = option
  }
}
