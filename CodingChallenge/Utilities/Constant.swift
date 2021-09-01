//
//  Constant.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation

struct Constant {
    //Web Service
    static let kServiceURL = "http://www.reddit.com/.json"
    static let kServicePagingURL = "http://www.reddit.com/.json?after="
    static let kPleaseWait = "Please Wait..."
    static let kOk = "Ok"
    static let kPullToRefresh = "Pull to refresh"
    static let kNoInternet = "No Internet Connection."
    static let kSorry = "Sorry"
    static let kNoData = "No data found"
    static let kFetchedDataSuccessfully = "Data fetched successfully!"
    static let kDataDidNotFetch = "Sorry data did not fetch."
    static let kServerNotResponding = "Server is not responding."
    static let kSpace = " "
    static let kPercent20 = "%20"
    static let kGet = "GET"
    static let kTimeOut = 60
    static let kAppTitle = "Coding Challenge"
    //UI
    static let kNoImage = "NoImage"
    static let kNoTitle = "Title: NA"
    static let kFeedTableViewCell = "FeedTableViewCell"
    static let kTableViewAccessId = "TableViewPic"
    //Loader
    static let kFFFFFF = "FFFFFF"
    static let k444444 = "444444"
    //MockResponse
    static let kResponse = "response"
    static let kJSONIssue = "Can't get data from response.json"
    static let kExpectedFailureWhenNoData = "Expected failure when no data"
    static let kJson = "json"
    static let kMissingFile = "Missing file:"
    static let kUnableToReadJson = "unable to read json"
    //ModelTest
    static let kRowCount = 1
    static let kExpectedRowCount = "Expected 1 row count"
    static let kExpectedValidFeedModel = "Expected valid FeedModel"
    static let kExpectedValidResponse = "Expected valid ResponseModel"
    //ViewModelTest
    static let kViewModel_NoData_Without_WebAPI = "ViewModel should not be able to fetch without Web API"
    static let kViewModel_NoDataFetch = "ViewModel should not be able to fetch"
    //WepApiTest
    static let kExpectedTaskNil = "Expected task nil"
    //NetworkTest
    static let kInternetUnavailable = "Internet is not accessible"
    //TableViewCell
    static let kSingleLine = 1
    static let kMultipleLine = 0
    static let kSytemFont = 16.0
    static let kFixPadding = 10.0
    static let kVerticalSpacing = 5.0
}
