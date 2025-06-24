//
//  PortraitView.swift
//  UalaMap
//
//  Created by Nestor Camela on 23/06/2025.
//
import SwiftUI
import CoreLocation

struct PortraitView: View {
    @State private var city: City?
    
    var body: some View {
        VStack {
            MainListView(landscape: $city)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LandscapeView()
}
