//
//  CarViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

class CarViewModel {
    
    @Published var cars: [Car] = []
    let fetchCarsURL = "https://cdn.sixt.io/codingtask/cars"
    var networkService: NetworkService!
    
    init() {
        networkService = NetworkService()
    }
    
    func fetchCars() {
        networkService.request(urlString: fetchCarsURL) { result in
            switch result {
            case .success(let data):
                let cars = getCarsFromData(data: data)
            case .failure(let error):
                break
            }
        }
    }
    
    func getCarsFromData(data: Data) -> [Car]? {
        guard let cars = try? JSONDecoder().decode([Car].self, from: data) else { return nil }
        return cars
    }
}

