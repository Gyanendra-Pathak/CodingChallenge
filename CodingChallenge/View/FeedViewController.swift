//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let feedTableView = UITableView()
    var apiFetch = ApiFetch()
    var viewModel: FeedViewModel!
    
    var refreshControl = UIRefreshControl()
    var refreshFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        viewModel = FeedViewModel(withService: apiFetch)
        self.getFeed(afterPaging: "")
    }
    
    func setUpUI() {
        view.backgroundColor = .white
        self.title = "Feed"
        feedTableView.accessibilityIdentifier = Constant.kTableViewAccessId
        feedTableView.rowHeight = UITableView.automaticDimension
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: Constant.kFeedTableViewCell)
        feedTableView.separatorStyle = .none
        view.addSubview(feedTableView)
        
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        
        feedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        feedTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        feedTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        feedTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.kPullToRefresh)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        feedTableView.addSubview(refreshControl)
    }
    
    @objc
    func refresh(_ sender: AnyObject) {
        // Code to refresh table view
        refreshFlag = true
        viewModel!.picArray.removeAll()
        self.getFeed(afterPaging: "")
    }
    
    // MARK: - WebAPI to get response of pic list
    func getFeed(afterPaging:String) {
        if afterPaging.isEmpty {
            Loader.showLoader(controller: self, loaderText: Constant.kPleaseWait, withIndicator: true)
        }
        viewModel!.webAPIToGetFeed(afterPaging: afterPaging) { [unowned self] (success, message, error) in
            Loader.hideLoader(controller: self)
            if success {
                updateUI()
            }
            else {
                updateUI()
                if message != nil {
                    self.showAlertPopUpWithSingleButton(title: Constant.kAppTitle, message: message!, buttonTitle: Constant.kOk) { (status) in
                    }
                }
                else{
                    self.callApiResponseFailure(error: error!)
                }
            }
        }
    }
    
    func updateUI() {
        if self.refreshFlag {
            self.refreshControl.endRefreshing()
            self.refreshFlag = false
        }
        self.feedTableView.dataSource = self
        self.feedTableView.delegate = self
        self.feedTableView.reloadData()
    }
}
