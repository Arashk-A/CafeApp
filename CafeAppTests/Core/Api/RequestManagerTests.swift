//
//  RequestManagerTests.swift
//  CafeAppTests
//
//  Created by zero on 5/5/23.
//

import XCTest

@testable import CafeApp
import RealmSwift

final class RequestManagerTests: XCTestCase {
  private var requestManager: RequestManagerProtocol? = nil

  override func setUp() {
    super.setUp()
    
    requestManager = RequestManager(apiManager: APIManagerMock())
  }
  
  func testRequestCffees() async throws {
    guard let coffees: [Coffee] = try await requestManager?.perform(CoffeesRequestMock.getCoffees) else {
      XCTFail("Didn't get data from the request manager")
      
      return
    }
    
    let coffee = coffees.first
    
    let types = coffee?.types
    
    let firstType = types?.first
    let lastType = types?.last
    
    XCTAssertEqual(coffee?.id, "60ba1ab72e35f2d9c786c610");
    
    // Check for types
    XCTAssertEqual(firstType?.id, "60ba1a062e35f2d9c786c56d")
    XCTAssertEqual(firstType?.name, "Ristretto")
    XCTAssertEqual(firstType?.sizes.first, "60ba18d13ca8c43196b5f606")
    XCTAssertEqual(firstType?.extras.first, "60ba197c2e35f2d9c786c525")
    
    
    XCTAssertEqual(lastType?.id, "60be1eabc45ecee5d77ad960")
    XCTAssertEqual(lastType?.name, "Cappuccino")
    XCTAssertEqual(lastType?.sizes.last, "60ba33dbc45ecee5d77a01f8")
    XCTAssertEqual(lastType?.extras.first, "60ba197c2e35f2d9c786c525")
    
  }

}
