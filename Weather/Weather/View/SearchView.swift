//
//  SearchView.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import SwiftUI

struct SearchView: View {
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var locationService: LocationService
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(locationService: locationService)
        
        List(locationService.searchResults, id: \.key) { result in
          CityCell(location: result, selectedLocation: $locationService.selectedLocation)
        }
        .onTapGesture {
          presentationMode.wrappedValue.dismiss()
        }
      }
      .navigationBarTitle(Text("Search Location"))
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView(locationService: LocationService(measurementType: MeasurementType(option: .imperial)))
  }
}
