//
//  NetworkService.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 30.08.22.
//

import Foundation

typealias Completion<T: Codable> =  (_ result: T?, _ error: String?) -> Void

struct NetworkService {
    func handleResponse<T: Codable>(data: Data?, error: Error?, dataType: T.Type, completion: @escaping Completion<T>) {
        if let error = error {
            completion(nil, error.localizedDescription)
        } else if let data = data {
            do {
                let result = try Decoder().decode(dataType.self, data: data)
                completion(result, nil)
            } catch {
                if let error = error as? DecodingError {
                    print(dataType, "error.decoding".localized, error)
                }
                completion(nil, "error.gen".localized)
            }
        } else {
            completion(nil, "error.gen".localized)
        }
    }

    func request<T: Codable>(endpoint: Endpoint, dataType: T.Type, completion: @escaping Completion<T>) {
        Router().request(endpoint) { (data, _, error) in
            handleResponse(data: data, error: error, dataType: dataType.self, completion: completion)
        }
    }
}
