//
//  CarsView.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

struct CarsView: View {
    @ObservedObject var carsViewModel = CarsViewModel()
    
    var body: some View {
        ForEach(carsViewModel.cars, id: \.id) { car in
            Text(car.name)
        }
        .onAppear {
            carsViewModel.fetchCars()
        }
    }
}
