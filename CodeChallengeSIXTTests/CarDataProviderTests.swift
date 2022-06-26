//
//  CarDataProviderTests.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import XCTest
@testable import CodeChallengeSIXT

class CarDataProviderTests: XCTestCase {
    
    private var carServices: FakeCarServices!
    private var sut: CarDataProvider!
    private var delegate: FakeCarDataProviderDelegate!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        carServices = FakeCarServices()
        sut = CarDataProviderImp(carServices: carServices)
        delegate = FakeCarDataProviderDelegate()
        sut.delegate = delegate
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        carServices = nil
        sut = nil
        delegate = nil
    }

    func test_fetchCarItems_success() {
        carServices.fetchCarItems_result = .success(generateFakeCars(count: 1))
        
        let didLoadExpectation = expectation(description: "cars loaded")
        didLoadExpectation.expectedFulfillmentCount = 2
        var previousState: CarDataProviderState?
        
        delegate.onStateChanged = { newState in
            if previousState == .loading {
                XCTAssertEqual(newState, .ready)
            } else {
                XCTAssertEqual(newState, .loading)
            }
            previousState = newState
            didLoadExpectation.fulfill()
        }
        
        sut.fetchCars()
        wait(for: [didLoadExpectation], timeout: 1)
        
        let firstCar = sut.items.first!
        XCTAssertEqual(sut.items.count, 1)
        XCTAssertEqual(firstCar.id, "1")
        XCTAssertEqual(firstCar.modelIdentifier, "modelIdentifier test 1")
    }
    
    func test_fetchCarItems_failure() {
        carServices.fetchCarItems_result = .failure(.generalError)
        
        let didLoadExpectation = expectation(description: "cars loaded")
        didLoadExpectation.expectedFulfillmentCount = 2
        var previousState: CarDataProviderState?
        
        delegate.onStateChanged = { newState in
            if previousState == .loading {
                XCTAssertEqual(newState, .error(CarServicesError.generalError))
            } else {
                XCTAssertEqual(newState, .loading)
            }
            previousState = newState
            didLoadExpectation.fulfill()
        }
        
        sut.fetchCars()
        wait(for: [didLoadExpectation], timeout: 1)

        XCTAssertEqual(sut.items.count, 0)
    }
}

extension CarDataProviderTests {
    func generateFakeCars(count: Int) -> [Car] {
        var cars: [Car] = []
        for index in 1...count {
            cars.append(Car(id: "\(index)",
                            modelIdentifier: "modelIdentifier test \(index)",
                            modelName: "modelName test \(index)",
                            name: "name test \(index)",
                            make: "make test \(index)",
                            group: "group test \(index)",
                            color: "color test \(index)",
                            series: "series test \(index)",
                            fuelType: "fuelType test \(index)",
                            fuelLevel: 0,
                            transmission: "transmission test \(index)",
                            licensePlate: "licensePlate test \(index)",
                            latitude: 0,
                            longitude: 0,
                            innerCleanliness: "innerCleanliness test \(index)",
                            carImageUrl: URL(string: "carImageUrl")!))
        }
        
        return cars
    }
}
