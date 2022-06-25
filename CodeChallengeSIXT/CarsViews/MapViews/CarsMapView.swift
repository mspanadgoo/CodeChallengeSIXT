//
//  CarsMapView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI
import MapKit
import CoreLocation

struct CarsMapView: View {
    let cars: [Car]
    
    @State var showDetailView: Bool = false
    @State private var selectedIndex: Int = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.114988, longitude: 11.598359), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $region,
                interactionModes: MapInteractionModes.all,
                showsUserLocation: true,
                annotationItems: cars) { location in MapAnnotation(
                    coordinate: location.coordinate,
                    content: {
                        Image(systemName: "car.fill").foregroundColor(.red)
                            .onTapGesture {
                                if let index: Int = cars.firstIndex(where: {$0.id == location.id}) {
                                    showDetailView.toggle()
                                    selectedIndex = index
                                }
                            }
                    })
                }
                .sheet(isPresented: $showDetailView, content: {
                    NavigationView {
                        CarDetailsView(viewModel: CarDetailsViewModel(car: cars[selectedIndex]))
                            .toolbar {
                                Button(action: {
                                    showDetailView.toggle()
                                }, label: {
                                    Image(systemName: "multiply.circle")
                                        .foregroundColor(.red)
                                })
                            }
                    }
                })
                .navigationBarTitle("Map", displayMode: .inline)
        }
    }
}

