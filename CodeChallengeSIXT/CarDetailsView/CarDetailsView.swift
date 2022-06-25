//
//  CarDetailsView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/4/1401 AP.
//

import SwiftUI

struct CarDetailsView: View {
    var viewModel: CarDetailsViewModel
    
    var body: some View {
        List {
            RemoteImage(url: viewModel.car.carImageUrl)
                .frame(height: 250)
            Text("Model Name: \(viewModel.car.modelName)")
            Text("Make: \(viewModel.car.make)")
            Text("Group: \(viewModel.car.group)")
            Text("Color: \(viewModel.car.color)")
            Text("Fuel Type: \(viewModel.car.fuelType)")
            Text("Fuel Level: \(viewModel.car.fuelLevel)")
            Text("Transmission: \(viewModel.car.transmission)")
            Text("License Plate: \(viewModel.car.licensePlate)")
        }
        .navigationTitle(viewModel.car.name)
    }
}
