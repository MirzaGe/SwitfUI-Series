//
//  FiveDayForecastView.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import SwiftUI

struct FiveDayForecastView: View {
  var forecasts: [Forecast]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      ForEach(forecasts, id: \.Date) { forecast in
        HStack(alignment: .center, spacing: 10) {
          Text(Helper.day(from: forecast.Date))
            .font(.title3)
            .frame(width: 110, alignment: .leading)
          
          Spacer()
          
          Image(Helper.iconName(phrase: forecast.Day.IconPhrase))
            .resizable()
            .frame(width: 20, height: 20, alignment: .center)
          
          Spacer()
          
          HStack(spacing: 20) {
            Text("\(Int(forecast.Temperature.Maximum.Value))")
              .frame(width: 30, alignment: .trailing)
            
            Text("\(Int(forecast.Temperature.Minimum.Value))")
              .frame(width: 30, alignment: .trailing)
              .opacity(0.5)
          }
          .frame(width: 100)
        }
      }
    }
    .padding()
  }
}

struct FiveDayForecastView_Previews: PreviewProvider {
  static var previews: some View {
    FiveDayForecastView(forecasts: [Forecast.mock()])
  }
}
