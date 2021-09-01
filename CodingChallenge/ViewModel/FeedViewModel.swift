//
//  FeedViewModel.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation

class FeedViewModel {
    var picArray = Array<Child>()
    var after:String?
    var titleResponse:String?
    private var service: CallServiceProtocol?
    
    init(withService service: CallServiceProtocol) {
        self.service = service
    }
    
    func webAPIToGetFeed(afterPaging: String, getCallBack: @escaping (_ success: Bool,_ message : String?, _ error: ApiError?)->Void) {
        let serviceURL = afterPaging.isEmpty ? Constant.kServiceURL : Constant.kServicePagingURL + afterPaging
        self.service?.getApiResponse(serviceURL: serviceURL){ (testType, status, message, model, error)  in
            if !testType {
                if status {
                    self.storeFeed(model: model)
                    getCallBack(true, Constant.kFetchedDataSuccessfully, error)
                }
                else{
                    getCallBack(status, nil, error)
                }
            }
            else {
                self.service?.getApiResponse(serviceURL: afterPaging){ (testType, status, message, model, error)  in
                    if !(model == nil) {
                        getCallBack(true, message, nil)
                    }
                    else{
                        getCallBack(false, message, nil)
                    }
                }
            }
        }
    }
    
    func storeFeed(model: FeedModel!) {
        self.after = model?.data.after
        if self.picArray.count > 0 {
            self.picArray.append(contentsOf: (model?.data.children)!)
        }
        else {
            self.picArray = (model?.data.children)!
        }
    }
}
