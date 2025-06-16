//
//  CityDetailView.swift
//  UalaMap
//
//  Created by Nestor Camela on 16/06/2025.
//

import SwiftUI
import MapKit

struct CityDetailView: View {
    var city: City
    
    var body: some View {
        let position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: city.coord?.lat ?? 51.507222, longitude: city.coord?.lon ?? -0.1275),
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
        
        VStack {
            Text("Map")
            Map(initialPosition: position)
              .frame(height: 200)
            Spacer()
          }
      }
}

#Preview {
    //CityDetailView(item: Item(id: 11, name: "name"))
}
