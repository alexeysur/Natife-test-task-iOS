//
//  FullPost.swift
//  LifeStories
//
//  Created by Alexey on 27.07.2021.
//

import Foundation

struct FullPost: Codable {
    var postId: Int
    var timeshamp: Int
    var title: String
    var text: String
    var likesCount: Int
    var images: [String]
    
    private enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case timeshamp =  "timeshamp"
        case title = "title"
        case text = "text"
        case likesCount = "likes_count"
        case images = "images"
    }
}

struct FullPosts: Codable {
    var post: FullPost
}
