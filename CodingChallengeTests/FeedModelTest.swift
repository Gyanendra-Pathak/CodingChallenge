//
//  FeedModelTest.swift
//  CodingChallengeTests
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import XCTest
@testable import CodingChallenge

class FeedModelTest: XCTestCase {
    var jsonParser:JSONParser?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        jsonParser = JSONParser()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        jsonParser = nil
    }
    
    func testEmptyDataResult(){
        let data = Data()
        let model = try? jsonParser?.parseJsonData(data: data)
        if model != nil {
            XCTAssert(false, Constant.kExpectedFailureWhenNoData)
        }
    }
    
    func testParseFeedsResult() {
        let data = MockResponse().getResponseData()
        let modelResponse = try? jsonParser?.parseJsonData(data: data)
        if let model = modelResponse {
            if let list = model.data.children {
                XCTAssertEqual(list.count, Constant.kRowCount, Constant.kExpectedRowCount)
                
            } else {
                XCTAssert(false, Constant.kExpectedValidFeedModel)
            }
        }
        else{
            XCTAssert(false, Constant.kExpectedValidResponse)
        }
    }
}
