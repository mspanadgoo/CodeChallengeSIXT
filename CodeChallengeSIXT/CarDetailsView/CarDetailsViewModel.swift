//
//  CarDetailsViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import Foundation

class CarDetailsViewModel {
    
    let name: String
    let carImageUrl: URL
    let modelName: String
    let make: String
    let group: String
    let color: String
    let fuelType: String
    let fuelLevel: Double
    let transmission: String
    let licensePlate: String
    
    init(car: Car) {
        self.name = car.name
        self.carImageUrl = car.carImageUrl
        self.modelName = car.modelName
        self.make = car.make
        self.group = car.group
        self.color = car.color
        self.fuelType = car.fuelType
        self.fuelLevel = car.fuelLevel
        self.transmission = car.transmission
        self.licensePlate = car.licensePlate
    }
}
