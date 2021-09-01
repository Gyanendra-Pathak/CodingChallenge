//
//  FeedModel.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation

// MARK: - FeedModel
struct FeedModel: Decodable {
    let data: FeedModelData
}

// MARK: - FeedModelData
struct FeedModelData: Decodable {
    let after: String
    let children: [Child]?
    
    enum CodingKeys: String, CodingKey {
        case after, children
    }
}

// MARK: - Child
struct Child: Decodable {
    let data: ChildData
}

// MARK: - ChildData
struct ChildData: Decodable {
    let title: String?
    let thumbnailHeight: Int?
    let thumbnailWidth: Int?
    let score: Int?
    let thumbnail: String?
    let numComments: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
        case score, thumbnail
        case numComments = "num_comments"     
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        score = try container.decode(Int.self, forKey: .score)
        numComments = try container.decode(Int.self, forKey: .numComments)
        thumbnailHeight = (try container.decodeIfPresent(Int.self, forKey: .thumbnailHeight)) ?? 1
        thumbnailWidth = (try container.decodeIfPresent(Int.self, forKey: .thumbnailWidth)) ?? 1
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}
