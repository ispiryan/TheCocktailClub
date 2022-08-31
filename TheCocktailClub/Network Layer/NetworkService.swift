//
//  NetworkService.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

struct NetworkService {

    func request<T:Codable>(url: URL, dataType: T.Type, completion:@escaping  (_ result: T?, _ error: String?) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error.localizedDescription)
            } else if let data = data {
                do {
                    let result = try Decoder().decode(dataType, data: data)
                    completion(result, nil)
                } catch {
                    completion(nil, "failed to decode")
                }
            } else {
                completion(nil, "general error")
            }
        }
        task.resume()
    }
}


