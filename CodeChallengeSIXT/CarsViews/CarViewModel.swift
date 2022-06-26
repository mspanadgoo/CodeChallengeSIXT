//
//  CarViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/6/1401 AP.
//

import Foundation

class CarViewModel {
    
    let name: String
    let carImageUrl: URL
    let modelName: String
    
    init(car: Car) {
        self.name = car.name
        self.carImageUrl = car.carImageUrl
        self.modelName = car.modelName
    }
}
