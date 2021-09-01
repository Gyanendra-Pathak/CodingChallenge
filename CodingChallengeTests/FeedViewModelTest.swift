//
//  FeedViewModelTest.swift
//  CodingChallengeTests
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import XCTest
@testable import CodingChallenge

class FeedViewModelTest: XCTestCase {
    private var mockAPI:MockApiFetch!
    private var viewModel:FeedViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockAPI = MockApiFetch()
        viewModel = FeedViewModel(withService: mockAPI)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mockAPI = nil
        viewModel = nil
    }
    
    func testFecthData() {
        mockAPI.apiData = FeedModel(data: FeedModelData(after: "t3_p76oxo", children: []))
        viewModel.webAPIToGetFeed(afterPaging: "") { (success, message, error) in
            if !success {
                XCTAssert(true, Constant.kViewModel_NoData_Without_WebAPI)
            }
        }
    }
    
    func testFetchNoData() {
        mockAPI.apiData = nil
        viewModel.webAPIToGetFeed(afterPaging: "") { (success, message, error) in
            if success {
                XCTAssert(false, Constant.kViewModel_NoDataFetch)
            }
        }
    }
}
