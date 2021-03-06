//
//  CarDataProvider.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import Foundation

enum CarDataProviderState: Equatable {
    static func == (lhs: CarDataProviderState, rhs: CarDataProviderState) -> Bool {
        switch (lhs, rhs) {
        case (.ready, .ready): return true
        case (.loading, .loading): return true
        case let (.error(error1 as NSError), .error(error2 as NSError)):
            return error1 == error2
        default:
            return false
        }
    }
    
    case ready
    case loading
    case error(Error)
}

protocol CarDataProviderDelegate: AnyObject {
    func carDataProviderStateChanged(state: CarDataProviderState)
}

protocol CarDataProvider {
    var items: [Car] { get }
    var state: CarDataProviderState { get }
    var delegate: CarDataProviderDelegate? { get set }
    
    func fetchCars()
}

class CarDataProviderImp: CarDataProvider {
    
    private (set) var items: [Car] = []
    private (set) var state: CarDataProviderState = .ready {
        didSet {
            delegate?.carDataProviderStateChanged(state: state)
        }
    }
    
    weak var delegate: CarDataProviderDelegate?
    
    private let carServices: CarServices
    
    init(carServices: CarServices) {
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
