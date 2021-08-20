//
//  ViewController+TableView.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation
import UIKit
import SDWebImage

@available(iOS 13.0, *)
extension ViewController{
    /*************------This is alert popup with single buttons------*****************/
    func showAlertPopUpWithSingleButton(title:String, message:String, buttonTitle : String, completion : @escaping (_ buttonClicked: Bool)->Void){
        
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
    
     
    
    // MARK: - Table view data source and delegate
       func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPicChild.count
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.kTableViewCell, for: indexPath) as! TableViewCell
           cell.selectionStyle = .none
        let noImage = UIImage(named: Constant.kNoImage)

        let childData = arrayPicChild[indexPath.row].data
        
        
        if let height = childData.thumbnailHeight, let width = childData.thumbnailWidth {
            let ratio = CGFloat(width / height)
            let newImageHeight = CGFloat(CGFloat(Int(UIScreen.main.bounds.width)) * ratio)
            cell.imageViewAuthor.heightAnchor.constraint(equalToConstant:CGFloat(newImageHeight)).isActive = true
        }
        
        
        if let url : String = childData.thumbnail {
            let fileUrl : NSURL = NSURL(string: url as String)!
            print(fileUrl)
            cell.imageViewAuthor.sd_setImage(with: fileUrl as URL, placeholderImage: noImage, options: SDWebImageOptions(rawValue: 1), completed: nil)
        }
        else{
            cell.imageViewAuthor.image = noImage
        }
        
        if let title = childData.title {
            cell.labelTitle.text = title
        }else{
            cell.labelTitle.text = Constant.kNoTitle
        }
        
        print("indexpatha=\(indexPath.row) \(childData.title) ImageView Frame=\(cell.imageViewAuthor.frame)")
        
        if let score = childData.score {
            cell.labelScore.text = "\(score)"
        }
        if let commentCount = childData.numComments {
            cell.labelComment.text = "\(commentCount)"
        }
        
           return cell
       }
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == arrayPicChild.count-1 {
            self.callGetWebAPIToGetPicList(afterPaging: (self.viewModel?.after)!)
        }
     }
}
