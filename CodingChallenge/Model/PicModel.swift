//
//  PicModel.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import Foundation

// MARK: - PicModel
struct PicModel: Decodable {
    let data: PicModelData
}

// MARK: - WelcomeData
struct PicModelData: Decodable {
    let after: String
    let children: [Child]?

    enum CodingKeys: String, CodingKey {
        case after
        case children
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
        case score
        case thumbnail
        case numComments = "num_comments"     
    }
}
