//
//  CarsMapView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct CarsMapView: View {
    
    let cars: [Car]
    
    @StateObject private var viewModel = CarsMapViewModel()
    @State private var showDetailView: Bool = false
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Map(
                    coordinateRegion: $viewModel.region,
                    interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    annotationItems: cars) { location in MapAnnotation(
                        coordinate: location.coordinate,
                        content: {
                            Image(systemName: "car.fill").foregroundColor(.orange)
                                .onTapGesture {
                                    if let index: Int = cars.firstIndex(where: {$0.id == location.id}) {
                                        showDetailView.toggle()
                                        selectedIndex = index
                                    }
                                }
                        })
                    }
                
                LocationButton(.currentLocation) {
                    viewModel.requestAllowOnceLocationPermission()
                }
                .foregroundColor(.white)
                .cornerRadius(8)
                .labelStyle(.titleAndIcon)
                .symbolVariant(.fill)
                .tint(.orange)
                .padding(.bottom, 50)
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
        .navigationViewStyle(.stack)
    }
}
