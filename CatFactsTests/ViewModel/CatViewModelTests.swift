//
//  CatViewModelTests.swift
//  CatFactsTests
//
//  Created by Neha Pant on 11/02/2025.
//

import XCTest
@testable import CatFacts

struct MockCatImage {
    static func getCatData() -> [CatImage] {
        let cat =  CatImage(
            id: "MTYzNTk2Mw",
            url: "https://cdn2.thecatapi.com/images/MTYzNTk2Mw.gif",
            breeds: [Breed(id: "tvan", name: "Turkish Van", temperament: "Agile, Intelligent, Loyal, Playful, Energetic")]
        )
        return [cat]
    }
}

class MockNetworkManager: NetworkService {
    var mockCatImage: [CatImage]
    
    init(mockCatImage: [CatImage] =  [CatImage(
        id: "MTYzNTk2Mw",
        url: "https://cdn2.thecatapi.com/images/MTYzNTk2Mw.gif",
        breeds: [Breed(
            id: "tvan",
            name: "Turkish Van",
            temperament: "Agile, Intelligent, Loyal, Playful, Energetic"
        )]
    )])  {
        self.mockCatImage = mockCatImage
    }
    
    func fetchCatsData<T>(limit: Int?, hasBreed breed: Bool?, breedId: String?) async throws -> [T] where T : Decodable {
        return self.mockCatImage as! [T]
    }
}


final class CatViewModelTests: XCTestCase {
    var sut: CatViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        sut = CatViewModel(networkManager: MockNetworkManager())
    }
    
    @MainActor
    func testFetchCatData() async {
        //given
        let catImageData = MockCatImage.getCatData()
        
        //when
        await sut.fetchCatsData()
        
        //then
        XCTAssertEqual(catImageData.first, sut.catsData.first)
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
