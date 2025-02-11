//
//  CatImageTests.swift
//  CatFactsTests
//
//  Created by Neha Pant on 11/02/2025.
//

import XCTest
@testable import CatFacts


final class CatImageTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func testCatImageEqual() {
        let catImage1 = CatImage(
          id: "1",
          url: "https://cdn2.thecatapi.com/images/MTYzNTk2Mw.gif",
          breeds: []
      )
      
       //when
       let catImage2 =  CatImage(
           id: "1",
           url: "https://cdn2.thecatapi.com/images/MTYzNTk2Mw.gif",
           breeds: []
       )
        
        XCTAssertEqual(catImage1, catImage2)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
