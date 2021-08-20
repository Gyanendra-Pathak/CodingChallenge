//
//  MockApiFetch.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//


import Foundation
@testable import CodingChallenge

class MockApiFetch: CallServiceProtocol {
    var apiData: PicModel?
    func getApiResponse(afterPaging:String, completion: @escaping ((_ testType:Bool, _ status:Bool, _ message:String?, _ data:PicModel?, _ error:ApiError?) -> Void)){
        if let data = apiData {
            completion(true, true, Constant.kFetchedDataSuccessfully, data, nil)
        } else {
            completion(true, false, Constant.kDataDidNotFetch, nil, nil)
        }
    }
}
