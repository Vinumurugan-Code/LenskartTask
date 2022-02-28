//
//  ListModelTest.swift
//  LenskartTaskTests
//
//  Created by vinumurugan E on 28/02/22.
//

import XCTest
@testable import LenskartTask

class ListModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let movie = Movies(original_language: "en", original_title: "A Dog's Journey", overview: "His Own existence", release_date: "2019-05-03", title: "A Dog's Journey", popularity: 88.00, video: false, vote_average: 9.1, vote_count: 1061, adult: false, backdrop_path: ".png", isWatch_list: nil)
        let results = Results(results: [movie], total_pages: 10, total_results: 100, page: 2)
        XCTAssertNotNil(results)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
