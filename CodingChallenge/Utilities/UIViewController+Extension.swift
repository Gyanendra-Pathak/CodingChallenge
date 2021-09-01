//
//  UIViewController+Extension.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 01/09/21.
//

import UIKit

extension UIViewController {
    /*************------This is alert popup with single buttons------*****************/
    func showAlertPopUpWithSingleButton(title: String, message: String, buttonTitle : String, completion : @escaping (_ buttonClicked: Bool)->Void){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let btnAction = UIAlertAction(title: buttonTitle, style: .default, handler: { (UIAlertAction)in
            completion(true)
        })
        alertController.addAction(btnAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func callApiResponseFailure(error : ApiError){
        switch error{
        case .NoInternet:
            self.showAlertPopUpWithSingleButton(title: Constant.kSorry, message: Constant.kNoInternet, buttonTitle: Constant.kOk, completion: { (btnclicked) in
            })
        case .ServerError(let message):
            self.showAlertPopUpWithSingleButton(title: Constant.kSorry, message: message, buttonTitle: Constant.kOk, completion: { (btnclicked) in
            })
        default:
            self.showAlertPopUpWithSingleButton(title: Constant.kSorry, message: Constant.kNoInternet, buttonTitle: Constant.kOk, completion: { (btnclicked) in
            })
        }
    }
}
