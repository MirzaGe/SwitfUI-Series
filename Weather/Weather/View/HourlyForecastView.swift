//
//  HourlyForecastView.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import SwiftUI

struct HourlyForecastView: View {
  @EnvironmentObject var measurementType: MeasurementType
  
  var hourlyForecasts: [CurrentWeatherHourly]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 20) {
        ForEach(hourlyForecasts, id: \.DateTime) { hourly in
          VStack(alignment: .center, spacing: 5.0) {
            Text(hourly.timeStr)
            
            Image(Helper.iconName(phrase: hourly.IconPhrase))
              .resizable()
              .frame(width: 20, height: 20, alignment: .center)
            
            Text(Helper.temperatureDisplay(value: hourly.Temperature.Value,
                                           unit: measurementType.option.unitTemperature))
          }
        }
      }
    }
    .frame(height: 100)
    .padding(.horizontal, 15)
  }
}

struct HourlyForecastView_Previews: PreviewProvider {
  static var previews: some View {
    HourlyForecastView(hourlyForecasts: [CurrentWeatherHourly.mock()])
  }
}
