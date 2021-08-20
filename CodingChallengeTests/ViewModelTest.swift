//
//  ViewModelTest.swift
//  CodingChallengeTests
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import XCTest
@testable import CodingChallenge

class ViewModelTest: XCTestCase {
   private var mockAPI:MockApiFetch!
   private var viewModel:ViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockAPI = MockApiFetch()
        viewModel = ViewModel(withService: mockAPI)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mockAPI = nil
        viewModel = nil
    }

    
    func testFecthData() {
        mockAPI.apiData = PicModel(data: PicModelData(after: "t3_p76oxo", children: []))
        viewModel.callGetWebAPIToGetPicList(afterPaging: "") { (success, message, error) in
            if !success {
                XCTAssert(true, Constant.kViewModel_NoData_Without_WebAPI)
            }
            }
    }

    func testFetchNoData() {
        mockAPI.apiData = nil
        viewModel.callGetWebAPIToGetPicList(afterPaging: "") { (success, message, error) in
        if success {
            XCTAssert(false, Constant.kViewModel_NoDataFetch)
        }
        }
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
