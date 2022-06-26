//
//  FakeCarDataProvider.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import Foundation
@testable import CodeChallengeSIXT

class FakeCarDataProvider: CarDataProvider {
    private (set) var items: [Car] = []
    private (set) var state: CarDataProviderState = .ready {
        didSet {
            delegate?.carDataProviderStateChanged(state: state)
        }
    }
    
    weak var delegate: CarDataProviderDelegate?
    
    private let carServices: FakeCarServices
    
    init(carServices: FakeCarServices) {
        self.carServices = carServices
    }
    
    func fetchCars() {
        state = .loading
        carServices.fetchCarItems(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let cars):
                self.items = cars
                self.state = .ready
            case .failure(let error):
                self.items = []
                self.state = .error(error)
            }
        })
    }
}
