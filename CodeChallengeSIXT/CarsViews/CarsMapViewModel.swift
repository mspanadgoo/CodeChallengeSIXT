//
//  CarsMapViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/6/1401 AP.
//

import CoreLocationUI
import MapKit

class CarsMapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    // Munich Coordinates
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.1351, longitude: 11.5820), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAllowOnceLocationPermission() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, latitudinalMeters: 0.2, longitudinalMeters: 0.2)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
