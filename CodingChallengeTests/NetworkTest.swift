//
//  NetworkTest.swift
//  CodingChallengeTests
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import XCTest
@testable import CodingChallenge

class NetworkTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testForNoInternetConnection(){
        let status = NetworkReachability.isConnectedToNetwork()
        if !status{
            XCTAssert(true, Constant.kInternetUnavailable)
        }
    }
}
