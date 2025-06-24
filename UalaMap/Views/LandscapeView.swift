//
//  LandscapeView.swift
//  UalaMap
//
//  Created by Nestor Camela on 23/06/2025.
//
import SwiftUI
import CoreLocation

struct LandscapeView: View {
    @State private var CityDetail: CityDetailView?
    @State private var city: City?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                MainListView(landscape: $city)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           VStack(alignment: .trailing) {
                CityDetailView(city: $city)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LandscapeView()
}

