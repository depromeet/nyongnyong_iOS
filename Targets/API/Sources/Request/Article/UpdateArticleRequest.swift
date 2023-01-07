//
//  UpdateArticleRequest.swift
//  API
//
//  Created by 김우성 on 2022/12/22.
//  Copyright © 2022 nyongnyong. All rights reserved.
//

import Foundation

public struct UpdateArticleRequest {
    
    let accessToken: String
    let articleId: Int
    
    let body: Body
    
    public struct Body: Encodable {
        let content: String
        let userId: Int
        let title: String
        let url: String
        let isPublic: Bool
        let tagIds: [Int]
        
        public init(
            content: String,
            userId: Int,
            title: String,
            url: String,
            isPublic: Bool,
            tagIds: [Int]
        ) {
            self.content = content
            self.userId = userId
            self.title = title
            self.url = url
            self.isPublic = isPublic
            self.tagIds = tagIds
        }
    }
    
    public init(accessToken: String, articleId: Int, body: Body) {
        self.accessToken = accessToken
        self.articleId = articleId
        self.body = body
    }
    
}

extension UpdateArticleRequest: URLRequestMakable {
    
    public func makeURLRequest(by baseURL: URL) -> URLRequest {
        var request = URLRequest(
            url: baseURL.appendingPathComponent("/article").appendingPathComponent("\(articleId)"),
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 10
        )
        request.httpMethod = HTTPMethod.put.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(self.body)
        
        return request
    }
    
}
