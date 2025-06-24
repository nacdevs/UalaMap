//
//  UalaMapTests.swift
//  UalaMapTests
//
//  Created by Nestor Camela on 16/06/2025.
//

import Testing
import XCTest
@testable import UalaMap

struct UalaMapTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    

    @Test func test_getCities () {
        // given
        let viewModel = CitiesVMMock()
        // when
        viewModel.getCities()
        // then
        XCTAssertGreaterThanOrEqual(viewModel.cities.count, 50)
    }

    @Test func test_search () {
        // given
        let exp = XCTestExpectation(description: "Searching")
        let viewModel = CitiesVMMock()
        
        //when
        viewModel.searchList("Alicante") {
            exp.fulfill()
        }
       
        //then
        XCTAssertNotNil(viewModel.$cities) 
    }
}
