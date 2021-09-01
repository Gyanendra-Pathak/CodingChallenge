//
//  JSONParser.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 27/08/21.
//

import Foundation

class JSONParser {
    func parseJsonData(data: Data?) throws -> FeedModel {
        let decoder = JSONDecoder()
        let objModel =  try decoder.decode(FeedModel.self, from: data!)
        return objModel
    }
}
