//
//  CarDetailView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/4/1401 AP.
//

import SwiftUI

struct CarDetailView: View {
    var car: Car
    
    var body: some View {
        List {
            RemoteImage(url: car.carImageUrl)
                .frame(height: 250)
            Text("Model Name: \(car.modelName)")
            Text("Make: \(car.make)")
            Text("Group: \(car.group)")
            Text("Color: \(car.color)")
            Text("Fuel Type: \(car.fuelType)")
            Text("Fuel Level: \(car.fuelLevel)")
            Text("Transmission: \(car.transmission)")
            Text("License Plate: \(car.licensePlate)")
        }
        .navigationTitle(car.name)
    }
}
