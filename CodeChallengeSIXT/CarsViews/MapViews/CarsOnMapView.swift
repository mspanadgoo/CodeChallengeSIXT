//
//  ContentView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI
import MapKit
import CoreLocation

struct CarsOnMapView: View {
    let cars: [Car]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.114988, longitude: 11.598359), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                annotationItems: cars,
                annotationContent: { location in
                    MapAnnotation(
                        coordinate: location.coordinate,
                        content: {
                            Image(systemName: "car.fill").foregroundColor(.red)
                        }
                    )
                }
            )
            .navigationBarTitle("Map", displayMode: .inline)
        }
    }
}

