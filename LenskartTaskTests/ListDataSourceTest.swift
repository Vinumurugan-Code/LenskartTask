//
//  ListDataSourceTest.swift
//  LenskartTaskTests
//
//  Created by vinumurugan E on 28/02/22.
//

import XCTest
@testable import LenskartTask

class ListDataSourceTest: XCTestCase {
    
    var datasource: ListDataSource<Movies>!
    
    override func setUp() {
        super.setUp()
        datasource = ListDataSource<Movies>()
    }
    
    override func tearDown() {
        datasource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        datasource.data.value = []
        let tableView = UITableView()
        tableView.dataSource = datasource
        XCTAssertEqual(datasource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        XCTAssertEqual(datasource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        datasource.data.value.append(Movies(original_language: "en", original_title: "A Dog's Journey", overview: "His Own existence", release_date: "2019-05-03", title: "A Dog's Journey", popularity: 88.00, video: false, vote_average: 9.1, vote_count: 1061, adult: false, backdrop_path: ".png", isWatch_list: nil))
        datasource.data.value.append(Movies(original_language: "en", original_title: "A Human's Journey", overview: "Friends the meaning", release_date: "2018-04-23", title: "A Human's Journey", popularity: 90.00, video: false, vote_average: 7.1, vote_count: 2222, adult: false, backdrop_path: ".png", isWatch_list: nil))
        let tableView = UITableView()
        tableView.dataSource = datasource
        XCTAssertEqual(datasource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        XCTAssertEqual(datasource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    
    func testValueCell() {
        datasource.data.value.append(Movies(original_language: "en", original_title: "A Dog's Journey", overview: "His Own existence", release_date: "2019-05-03", title: "A Dog's Journey", popularity: 88.00, video: false, vote_average: 9.1, vote_count: 1061, adult: false, backdrop_path: ".png", isWatch_list: nil))
        let tableView = UITableView()
        tableView.dataSource = datasource
        tableView.register(ListTableVCell.self, forCellReuseIdentifier: "ListTableVCell")
        let indexPath = IndexPath(row: 0, section: 1)
        let cell = tableView.cellForRow(at: indexPath)
        XCTAssertNil(cell)
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "ListTableVCell", for: indexPath) as! ListTableVCell
        XCTAssertNotNil(cell1)
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
