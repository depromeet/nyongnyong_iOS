//
//  KakaoLoginRequest.swift
//  API
//
//  Created by 김우성 on 2022/12/21.
//  Copyright © 2022 nyongnyong. All rights reserved.
//

import Foundation

public struct KakaoLoginRequest: Encodable {

    public let accessToken: String
    let provider: String = "KAKAO"
    
    public init(accessToken: String) {
        self.accessToken = accessToken
    }

}

extension KakaoLoginRequest: URLRequestMakable {
    
    public func makeURLRequest(by baseURL: URL) -> URLRequest {
        var request = URLRequest(
            url: baseURL.appendingPathExtension("/auth/*/login"),
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 10
        )
        request.httpMethod = HTTPMethod.post.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(self)
        
        return request
    }
    
}
