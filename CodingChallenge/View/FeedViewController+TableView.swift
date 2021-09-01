//
//  ViewController+TableView.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import UIKit

extension FeedViewController {    
    // MARK: - Table view data source and delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.picArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.kFeedTableViewCell, for: indexPath) as! FeedTableViewCell
        cell.selectionStyle = .none
        
        if (self.viewModel?.picArray.count)! > 0 {
            guard let childData = self.viewModel?.picArray[indexPath.row].data else { return cell }
            cell.configureCell(childData: childData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.viewModel?.picArray.count)!-1 {
            self.getFeed(afterPaging: (self.viewModel?.after)!)
        }
    }
}
