//
//  CodingChallengeProtocol.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation
protocol CallServiceProtocol {
    func getApiResponse(afterPaging:String, completion: @escaping ((_ testType:Bool, _ status:Bool, _ message:String?, _ data:PicModel?, _ error:ApiError?) -> Void))
}
