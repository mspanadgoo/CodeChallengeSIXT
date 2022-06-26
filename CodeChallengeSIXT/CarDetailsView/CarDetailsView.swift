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
            RemoteImage(url: viewModel.carImageUrl, failure: Image("DefaultCarImage"))
                .frame(height: 250)
            Text("Model Name: \(viewModel.modelName)")
            Text("Make: \(viewModel.make)")
            Text("Group: \(viewModel.group)")
            Text("Color: \(viewModel.color)")
            Text("Fuel Type: \(viewModel.fuelType)")
            Text("Fuel Level: \(viewModel.fuelLevel)")
            Text("Transmission: \(viewModel.transmission)")
            Text("License Plate: \(viewModel.licensePlate)")
        }
        .navigationBarTitle(viewModel.name, displayMode: .inline)
    }
}
