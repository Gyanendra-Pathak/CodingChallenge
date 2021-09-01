//
//  ApiFetch.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation

class ApiFetch: CallServiceProtocol {
    
    func getApiResponse(serviceURL: String, completion: @escaping ((_ testType: Bool, _ status:Bool, _ message: String?, _ data: FeedModel?, _ error: ApiError?) -> Void)){
        WebAPIHelper.sharedInstance.callWebAPIGetRequest(serviceURL: serviceURL) { (data, error)  in
            if error == nil {
                do {
                    guard let data = data else {
                        completion(false, false, Constant.kNoData, nil, error)
                        return
                    }
                    if
                        let response = String(data: data, encoding: String.Encoding.ascii),
                        let dataFinal = response.data(using: String.Encoding.utf8) {
                        let objModel =  try JSONParser().parseJsonData(data: dataFinal)
                        completion(false, true, Constant.kFetchedDataSuccessfully, objModel, error)
                    }
                    else{
                        completion(false, false, Constant.kDataDidNotFetch, nil, error)
                    }
                } catch{
                    completion(false, false, nil, nil, ApiError.ServerError(message: Constant.kServerNotResponding))
                }
            }
            else{
                completion(false, false, nil, nil, error)
            }
        }
    }
}
