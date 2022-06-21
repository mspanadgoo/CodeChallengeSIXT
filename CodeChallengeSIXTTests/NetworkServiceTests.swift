//
//  NetworkServiceTests.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 3/31/1401 AP.
//

import XCTest
@testable import CodeChallengeSIXT

class NetworkServiceTests: XCTestCase {
    
    var networkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkService()
    }

    override func tearDown() {
        networkService = nil
        super.tearDown()
    }
    
    func testBadURLRequest() {
        let url = ""
        networkService.request(urlString: url) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.badURL.errorDescription)
            default: break
            }
        }
    }
    
    func testSuccessfulRequest() {
        let url = "https://cdn.sixt.io/codingtask/cars"
        networkService.request(urlString: url) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            default: break
            }
        }
    }
}
