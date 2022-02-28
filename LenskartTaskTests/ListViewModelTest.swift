//
//  ListViewModelTest.swift
//  LenskartTaskTests
//
//  Created by vinumurugan E on 28/02/22.
//

import XCTest
@testable import LenskartTask

class ListViewModelTest: XCTestCase {
    
    var viewModel : ListViewModel!
    var dataSource : ListDataSource<Movies>!
    fileprivate var service : APIService!
    
    override func setUp() {
        super.setUp()
        self.service = APIService()
        self.dataSource = ListDataSource<Movies>()
        self.viewModel = ListViewModel(dataSource: dataSource)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService() {
        let expectation = XCTestExpectation(description: "No Service")
        dataSource.data.addObserver(self) { _ in
            expectation.fulfill()
        }
        service = nil
        viewModel.fetchLists()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchListWithService() {
        let expectation = XCTestExpectation(description: "Service")
        dataSource.data.addObserver(self) { _ in
            expectation.fulfill()
        }
        viewModel.fetchLists()
        wait(for: [expectation], timeout: 5.0)
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
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
