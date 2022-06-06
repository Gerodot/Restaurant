//
//  NetworkManager.swift
//  Restaurant
//
//  Created by Gerodot on 6/6/22.
//

import Foundation

class NetworkManager {
    let initalURL = URL(string: "http://oracle.getoutfit.co:8090")!
    
    func getCategories(completion: @escaping ([String]?,Error?) -> Void) {
        let url = initalURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: url) {data, _,error in
            guard let data = data else {
                completion(nil, error)
                return
            }

            let decoder = JSONDecoder()
            do {
                let decodedDate = try decoder.decode(Categories.self, from: data)
                completion(decodedDate.categories, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
        
    }
}
