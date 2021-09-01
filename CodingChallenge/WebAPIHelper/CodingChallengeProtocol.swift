//
//  CodingChallengeProtocol.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation

protocol CallServiceProtocol {
    func getApiResponse(serviceURL: String, completion: @escaping ((_ testType: Bool, _ status: Bool, _ message: String?, _ data: FeedModel?, _ error: ApiError?) -> Void))
}
