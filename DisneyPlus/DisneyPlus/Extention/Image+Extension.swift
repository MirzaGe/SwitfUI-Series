//
//  Image+Extension.swift
//  DisneyPlus
//
//  Created by sherry on 12/04/2021.
//

import SwiftUI

extension Image: Identifiable {
  public var id: String {
    return UUID().uuidString
  }
}
