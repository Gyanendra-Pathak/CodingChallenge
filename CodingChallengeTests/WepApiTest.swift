//
//  WepApiTest.swift
//  CodingChallengeTests
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import XCTest
@testable import CodingChallenge

class WepApiTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testCancelRequest() {
        let webApi = WebAPIHelper.sharedInstance
        webApi.callWebAPIGetRequest(serviceURL: Constant.kServiceURL) { _,_  in }
        webApi.cancelFetchResponse()
        XCTAssertNil(webApi.task, Constant.kExpectedTaskNil)
    }
}
