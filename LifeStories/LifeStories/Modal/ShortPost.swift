//
//  Post.swift
//  LifeStories
//
//  Created by Alexey on 24.07.2021.
//

import Foundation

struct ShortPost: Codable {
    var postId: Int
    var timeshamp: Int
    var title: String
    var previewText: String
    var likesCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case timeshamp =  "timeshamp"
        case title = "title"
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
    
}

struct ShortPosts: Codable {
    var posts: [ShortPost]
}


