//
//  MockResponse.swift
//  CodingChallengeTests
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import XCTest
@testable import CodingChallenge
class MockResponse {
    let apiFetch = ApiFetch()
    func getResponseData() -> Data {
        guard let data = self.readJson(forResource: Constant.kResponse) else {
            XCTAssert(false, Constant.kJSONIssue)
            return Data()
        }
        return data
    }

    func readJson(forResource fileName: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: Constant.kJson) else {
            XCTFail("\(Constant.kMissingFile) \(fileName).\(Constant.kJson)")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            XCTFail(Constant.kUnableToReadJson)
            return nil
        }
    }
    
}

    
