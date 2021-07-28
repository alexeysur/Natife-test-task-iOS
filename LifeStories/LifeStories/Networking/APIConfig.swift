//
//  APIConfig.swift
//  LifeStories
//
//  Created by Alexey on 27.07.2021.
//

import Foundation

enum paragraph: String {
    case posts
    case postID
  
}


final class APIConfig {
    let host = "raw.githubusercontent.com"
    let path = "/aShaforostov/jsons/master/api"
    
    var baseURL: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        return urlComponents
    }
    
    func fetchURL(with resources: paragraph, parameter: Int) -> URL? {
        var urlComponents = baseURL
       
        switch resources {
        case .posts:
            urlComponents.path = urlComponents.path + "/main.json"
        case .postID:
            urlComponents.path = urlComponents.path + "/posts/\(parameter).json"
        }

        guard let url = urlComponents.url else {
            print("Error create url")
            return nil
        }
        
        return url
    }
    
}

extension URLComponents {
    mutating func setQueryItems<T: LosslessStringConvertible>(with parameters: [String: T]) {
                      self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String($0.value)) }
                  }
}
