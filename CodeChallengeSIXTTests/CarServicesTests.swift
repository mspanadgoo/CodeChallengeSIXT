//
//  CarServicesTests.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import XCTest
@testable import CodeChallengeSIXT

class CarServicesTests: XCTestCase {
    
    var urlSession: URLSession!
    var sut: CarServicesImp!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
        sut = CarServicesImp(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        urlSession = nil
        sut = nil
    }

    func test_fetchCarItems_success() {
        // Set mock data
        let mockJSON = """
                [{
                "id": "WMWSW31030T222518",
                "modelIdentifier": "mini",
                "modelName": "MINI",
                "name": "Vanessa",
                "make": "BMW",
                "group": "MINI",
                "color": "midnight_black",
                "series": "MINI",
                "fuelType": "D",
                "fuelLevel": 0.7,
                "transmission": "M",
                "licensePlate": "M-VO0259",
                "latitude": 48.134557,
                "longitude": 11.576921,
                "innerCleanliness": "REGULAR",
                "carImageUrl": "https://cdn.sixt.io/codingtask/images/mini.png"
                }]
            """
        let mockData = mockJSON.data(using: .utf8) ?? Data()
        
        MockURLProtocol.requestHandler = { request throws in
            return (HTTPURLResponse(), mockData, nil)
        }
        
        let expectation = XCTestExpectation(description: "response")
        
        sut.fetchCarItems { result in
            switch result {
            case .success(let cars):
                XCTAssertEqual(cars.count, 1)
                let firstCar = cars.first!
                XCTAssertEqual(firstCar.id, "WMWSW31030T222518")
                XCTAssertEqual(firstCar.modelIdentifier, "mini")
                expectation.fulfill()
            case .failure:
                XCTFail("failed it should be success request!")
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_fetchCarItems_failure() {
        MockURLProtocol.requestHandler = { request throws in
            return (HTTPURLResponse(), nil, CarServicesError.generalError)
        }
        
        let expectation = XCTestExpectation(description: "response")
        
        sut.fetchCarItems { result in
            switch result {
            case .success:
                XCTFail("failed it should be success request!")
            case .failure(let error):
                XCTAssertEqual(error, .generalError)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
