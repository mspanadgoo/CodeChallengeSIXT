//
//  FakeCarServices.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import Foundation
@testable import CodeChallengeSIXT

class FakeCarServices: CarServices {
    var fetchCarItems_result: Result<[Car], CarServicesError> = .failure(CarServicesError.generalError)
    func fetchCarItems(completion: @escaping (Result<[Car], CarServicesError>) -> Void) {
        completion(fetchCarItems_result)
    }
}
