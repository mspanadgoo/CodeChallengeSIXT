//
//  CarViewModel.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/30/1401 AP.
//

import SwiftUI

class CarViewModel {
    
    @Published var cars: [Car] = []
    
    

}

class NetworkService {
    let urlString = "https://cdn.sixt.io/codingtask/cars"
    
    func fetchCars(completion: @escaping (Result<[Car], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(CarFetchError.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(CarFetchError.failedToFetchCars))
                return
            }
            guard let cars = try? JSONDecoder().decode([Car].self, from: data) else {
                completion(.failure(CarFetchError.failedToFetchCars))
                return
            }
            
            completion(.success(cars))
        }.resume()
    }
}

enum CarFetchError: Error {
    case badURL
    case failedToFetchCars
}
