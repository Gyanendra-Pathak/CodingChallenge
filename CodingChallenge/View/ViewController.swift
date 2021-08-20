//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
let tableViewPic = UITableView()
var apiFetch = ApiFetch()
var viewModel:ViewModel?
    
var arrayPicChild = Array<Child>()
var refreshControl = UIRefreshControl()
var refreshFlag = false
    

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .white
    self.title = "Pic List"
    viewModel = ViewModel(withService: apiFetch)
    
    tableViewPic.accessibilityIdentifier = Constant.kTableViewAccessId
    tableViewPic.rowHeight = UITableView.automaticDimension
    tableViewPic.register(TableViewCell.self, forCellReuseIdentifier: Constant.kTableViewCell)
    view.addSubview(tableViewPic)
    
    tableViewPic.translatesAutoresizingMaskIntoConstraints = false
            
    tableViewPic.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableViewPic.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
    tableViewPic.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
    tableViewPic.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
    refreshControl.attributedTitle = NSAttributedString(string: Constant.kPullToRefresh)
    refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    tableViewPic.addSubview(refreshControl)
    self.callGetWebAPIToGetPicList(afterPaging: "")
}

@objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
    refreshFlag = true
    viewModel!.picArray.removeAll()
    self.callGetWebAPIToGetPicList(afterPaging: "")
}

// MARK: - WebAPI to get response of pic list
    func callGetWebAPIToGetPicList(afterPaging:String) {
    if afterPaging.isEmpty {
    Loader.showLoader(controller: self, loaderText: Constant.kPleaseWait, withIndicator: true)
    }
    viewModel!.callGetWebAPIToGetPicList(afterPaging: afterPaging) { [unowned self] (success, message, error) in
        Loader.hideLoader(controller: self)
        if success {
            if self.refreshFlag {
                self.arrayPicChild.removeAll()
                self.refreshControl.endRefreshing()
                self.refreshFlag = false
            }
            //update table with data
            if afterPaging.isEmpty {
            if self.viewModel!.picArray.count > 0{
                    self.arrayPicChild = self.viewModel!.picArray
            }
            }
            else{
                if self.viewModel!.picArray.count > 0{
                    self.arrayPicChild.append(contentsOf: self.viewModel!.picArray)
                }
            }
            self.tableViewPic.dataSource = self
            self.tableViewPic.delegate = self
            self.tableViewPic.reloadData()
        }
            
        else{
            if self.refreshFlag {
                self.refreshControl.endRefreshing()
                self.refreshFlag = false
                self.arrayPicChild.removeAll()
                self.viewModel?.picArray.removeAll()
                self.tableViewPic.dataSource = self
                self.tableViewPic.delegate = self
                self.tableViewPic.reloadData()
            }
            if message != nil {
                self.showAlertPopUpWithSingleButton(title: Constant.kAppTitle, message: message!, buttonTitle: Constant.kOk) { (status) in
                    if status{
                    }
                }
            }
            else{
                self.callApiResponseFailure(error: error!)
            }
        }
    }
 }
}

