//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
  @EnvironmentObject var measurementType: MeasurementType
  
  var city: String
  var weather: CurrentWeather
  var hiLoForecast: Forecast?
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      Text(city)
        .font(.custom("Helvetica-Neue", size: 30))
      
      Text(weather.WeatherText)
        .font(.callout)
      
      Spacer()
      
      HStack {
        Text(Helper.temperatureDisplay(value: weather.temperatureValue(for: measurementType).Value,
                                       unit: measurementType.option.unitTemperature))
        
        Text(weather.temperatureValue(for: measurementType).Unit)
      }
      .font(.custom("HelveticaNeue-Light", size: 60))
      
      if let forecast = hiLoForecast {
        let hiTemp = Helper.temperatureDisplay(value: forecast.Temperature.Maximum.Value,
                                               unit: measurementType.option.unitTemperature)
        
        let lowTemp = Helper.temperatureDisplay(value: forecast.Temperature.Minimum.Value,
                                                unit: measurementType.option.unitTemperature)
        
        Text("H:\(hiTemp) L:\(lowTemp)")
          .font(.callout)
      }
      
      Spacer()
    }
    .frame(height: 160)
  }
}

struct CurrentWeatherView_Previews: PreviewProvider {
  static var previews: some View {
    CurrentWeatherView(city: "Denver",
                       weather: CurrentWeather.mock())
  }
}
