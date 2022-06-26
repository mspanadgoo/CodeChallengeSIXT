//
//  CarDataProviderTests.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 4/5/1401 AP.
//

import XCTest
@testable import CodeChallengeSIXT

class CarDataProviderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchCarItems_success() {
        let carServices = FakeCarServices()
        carServices.fetchCarItems_result = .success(generateFakeCars(count: 1))
        
        let sut = FakeCarDataProvider(carServices: carServices)
        
        sut.fetchCars()
        
        XCTAssertEqual(sut.items.count, 1)
        let firstCar = sut.items.first!
        XCTAssertEqual(firstCar.id, "1")
        XCTAssertEqual(firstCar.modelIdentifier, "modelIdentifier test 1")
    }
    
    func test_fetchCarItems_failure() {
        let carServices = FakeCarServices()
        carServices.fetchCarItems_result = .failure(.generalError)
        
        let sut = FakeCarDataProvider(carServices: carServices)
        
        sut.fetchCars()
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
