//
//  CarsViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI
import Combine

class CarsViewModel: ObservableObject {
    private let fetchCarsURL = "https://cdn.sixt.io/codingtask/cars"
    private var task: AnyCancellable?
    
    @Published var cars: [Car] = []
    
    func fetchCars() {
        guard let url = URL(string: fetchCarsURL) else { return }
        
        task = URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: [Car].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \CarsViewModel.cars, on: self)
    }
}

extension CarsViewModel {
    enum NetworkError: LocalizedError {
        case badURL
        case serviceError
        
        var errorDescription: String? {
            switch self {
            case .badURL: return "Entered URL is not correct!"
            case .serviceError: return "Could not fetch results."
            }
        }
    }
}
