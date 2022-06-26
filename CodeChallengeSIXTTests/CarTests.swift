//
//  CarTests.swift
//  CodeChallengeSIXTTests
//
//  Created by Mohammad Sadegh Panadgoo on 4/6/1401 AP.
//

import XCTest
@testable import CodeChallengeSIXT

class CarTests: XCTestCase {
    
    private var sut: [Car]!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testCars() throws {
        let sampleJSONData = """
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
            """.data(using: .utf8)!
        
        sut = try JSONDecoder().decode([Car].self, from: sampleJSONData)
        
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(sut[0].id, "WMWSW31030T222518")
        XCTAssertEqual(sut[0].modelIdentifier, "mini")
    }
}
