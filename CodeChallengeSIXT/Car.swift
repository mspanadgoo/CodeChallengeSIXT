//
//  Car.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import CoreLocation

struct Car: Decodable, Identifiable {
    var id: String
    var modelIdentifier: String
    var modelName: String
    var name: String
    var make: String
    var group: String
    var color: String
    var series: String
    var fuelType: String
    var fuelLevel: Double
    var transmission: String
    var licensePlate: String
    var latitude: Double
    var longitude: Double
    var innerCleanliness: String
    var carImageUrl: String
}

extension Car {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
