//
//  CityCell.swift
//  Weather
//
//  Created by sherry on 11/04/2021.
//

import SwiftUI

struct CityCell: View {
  var location: Location?
  @Binding var selectedLocation: Location?
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(location?.localizedName ?? "")
        .foregroundColor(.primary)
      
      Text("\(location?.administrativeArea.localizedName ?? ""), \(location?.country.localizedName ?? "")")
        .font(.callout)
        .foregroundColor(.secondary)
    }
    .onTapGesture {
      selectedLocation = location
    }
    .padding(.horizontal, 10)
  }
}

struct CityCell_Previews: PreviewProvider {
  @State static var location: Location?
  
  static var previews: some View {
    CityCell(location: Location.mock(), selectedLocation: $location)
  }
}
