//
//  NetworkService.swift
//  CodeChallengeSIXT
//
//  Created by Mohammad Sadegh Panadgoo on 3/31/1401 AP.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data else {
                completion(.failure(NetworkError.serviceError))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

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
