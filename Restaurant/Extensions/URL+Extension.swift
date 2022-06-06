//
//  URL+Extension.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        return components?.url
    }
}
