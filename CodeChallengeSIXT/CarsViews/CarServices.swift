//
//  CarServices.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import Foundation
import Combine

enum APP_API {
    static var baseURL: String {
        "https://cdn.sixt.io/"
    }
    
    enum CarEndpoints {
        static var cars: String {
            "codingtask/cars"
        }
    }
}

protocol CarServices {
    func fetchCarItems(completion: @escaping (Result<[Car], CarServicesError>) -> Void )
}

enum CarServicesError: Error {
    case generalError
}

class CarServicesImp: CarServices {
    
    var cancellables = Set<AnyCancellable>()

    func fetchCarItems(completion: @escaping (Result<[Car], CarServicesError>) -> Void) {
        guard let url = URL(string: APP_API.baseURL + APP_API.CarEndpoints.cars) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .print()
            .map {$0.data}
            .decode(type: [Car].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { complete in
                switch complete {
                case .failure:
                    completion(.failure(CarServicesError.generalError))
                case .finished:
                    print("fine!")
                }
            }, receiveValue: {
                completion(.success($0))
            })
            .store(in: &cancellables)
    }
}
