//
//  MapView.swift
//  UalaMap
//
//  Created by Nestor Camela on 23/06/2025.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var city: City?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        
        guard let city = city else { return }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: city.coord?.lat ?? 40.7128, longitude: city.coord?.lon ?? -74.0060)
        annotation.title = city.name
        mapView.addAnnotation(annotation)

        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: city.coord?.lat ?? 40.7128, longitude: city.coord?.lon ?? -74.0060),
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
    }
}
