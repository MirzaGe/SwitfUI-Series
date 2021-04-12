//
//  WeatherView.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import SwiftUI

struct WeatherView: View {
  @EnvironmentObject var measurementType: MeasurementType
  @ObservedObject var locationService: LocationService
  @State private var toggleSearchLocation = false
  
  var body: some View {
    GeometryReader { geo in
      NavigationView {
        ZStack(alignment: .center) {
          Image(locationService.currentWeather?.IsDayTime ?? true ? "bgDay" : "bgNight")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .frame(width: geo.size.width, height: geo.size.height)
          
          VStack {
            if let location = locationService.selectedLocation,
               let weather = locationService.currentWeather {
              CurrentWeatherView(city: location.localizedName,
                                 weather: weather,
                                 hiLoForecast: locationService.forecasts.first)
              
              Divider()
                .background(Color.white)
              
              HourlyForecastView(hourlyForecasts: locationService.hourlyForecasts)
              
              Divider()
                .background(Color.white)
              
              FiveDayForecastView(forecasts: locationService.forecasts)
              
              Divider()
                .background(Color.white)
              
              HStack {
                Spacer()
                
                Button(action: {
                  measurementType.option = measurementType.option == .metric
                    ? .imperial
                    : .metric
                  
                  locationService.measurementType = measurementType
                },
                label: {
                  HStack(spacing: 0) {
                    Text("°C")
                      .opacity(measurementType.option == .metric ? 1 : 0.5)
                    
                    Text("/")
                    
                    Text("°F")
                      .opacity(measurementType.option == .imperial ? 1 : 0.5)
                  }
                })
                .font(.headline)
                .padding(.trailing, 15)
              }
              
              Spacer()
            }
            else {
              VStack(alignment: .center, spacing: 20) {
                Image(systemName: "thermometer")
                  .resizable()
                  .frame(width: 60, height: 100, alignment: .center)
                
                Text("Search for a city to display the weather")
              }
              .frame(width: geo.size.width)
              
              Spacer()
            }
          }
          .foregroundColor(.white)
          .navigationBarItems(trailing: Button(action: {
            self.toggleSearchLocation.toggle()
          }, label: {
            Image(systemName: "magnifyingglass")
              .resizable()
              .frame(width: 30, height: 30)
              .foregroundColor(.white)
              .opacity(0.5)
          }))
        }
        .sheet(isPresented: $toggleSearchLocation, content: {
          SearchView(locationService: locationService)
        })
      }
    }
  }
}

struct WeatherView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView(locationService: LocationService(measurementType: MeasurementType(option: .imperial)))
  }
}
