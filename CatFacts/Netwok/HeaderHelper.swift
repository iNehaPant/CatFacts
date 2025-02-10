//
//  HeaderHelper.swift
//  CatFacts
//
//  Created by Neha Pant on 09/02/2025.
//

import Foundation

struct HeadersHelper {
    enum HeaderKeys: String {
        case contentType = "Content-Type"
        case xAppKey = "x-api-key"
    }
    
    static func getDefaultHeaders() -> [String: String] {
        var headers = [String: String]()
        headers[HeaderKeys.contentType.rawValue] = "application/json"
        headers[HeaderKeys.xAppKey.rawValue] = "live_vMwInkrHfbqzDMZdbcl6xgLejQNQvk6TSqaxvOtqNe9vuPghowCcbiPU4xVp1RWW"
        return headers
    }
}
