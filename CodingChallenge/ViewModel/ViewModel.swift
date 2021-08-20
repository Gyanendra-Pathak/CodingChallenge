//
//  ViewModel.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation


class ViewModel: NSObject {
var picArray = Array<Child>()
    var after:String?
    var titleResponse:String?
    private var service: CallServiceProtocol?

    init(withService service: CallServiceProtocol) {
        self.service = service
    }
    
    
func callGetWebAPIToGetPicList(afterPaging:String, getCallBack: @escaping (_ success: Bool,_ message : String?, _ error:ApiError?)->Void){
        self.service?.getApiResponse(afterPaging: afterPaging){ (testType, status, message, model, error)  in
            if !testType {
            if status {
                self.picArray = (model?.data.children)!
                self.after = model?.data.after
                if (self.picArray.count > 0) {
                    getCallBack(true, Constant.kFetchedDataSuccessfully, error)
                }
                else {
                    getCallBack(false, Constant.kServerIssue, error)
                }
        }
            else{
                getCallBack(status, nil, error)
            }
        }
            else {
                self.service?.getApiResponse(afterPaging: afterPaging){ (testType, status, message, model, error)  in
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
}
