//
//  CarsViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

class CarsViewModel: ObservableObject {
    
    @Published var state: CarDataProviderState = .loading
    @Published var cars: [Car] = []
    
    let mapTabTitle = "Map"
    let listTabTitle = "Car List"
    
    private var carDataProvider: CarDataProvider
    
    init(carDataProvider: CarDataProvider) {
        self.carDataProvider = carDataProvider
        self.carDataProvider.delegate = self
    }
    
    func fetchCars() {
        carDataProvider.fetchCars()
    }
}

extension CarsViewModel: CarDataProviderDelegate {
    func carDataProviderStateChanged(state: CarDataProviderState) {
        self.state = state
        if case .ready = state {
            cars = carDataProvider.items
        }
    }
}
