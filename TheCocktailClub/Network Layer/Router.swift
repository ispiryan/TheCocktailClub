//
//  Router.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 31.08.22.
//

import Foundation

final class Router: NSObject, NetworkRouter {

    private var task: URLSessionTask?
    private let timeout = 30.0

    func request(_ endpoint: Endpoint, completion: @escaping MainCompletion) {
        let session = URLSession(configuration: .default)
        do {
            let request = try self.buildRequest(from: endpoint)
            Self.log(request: request as NSURLRequest, data: request.httpBody)
            self.task = session.dataTask(with: request, completionHandler: { data, response, error in
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
            })
        } catch {
            DispatchQueue.main.async {
                completion(nil, nil, error)
            }
        }
        self.task?.resume()
    }

    func cancel() {
        self.task?.cancel()
    }

    private func buildRequest(from endpoint: Endpoint) throws -> URLRequest {
        URLRequest(url: endpoint.url,
                   cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                   timeoutInterval: timeout)

    }
}

// MARK: - LOG
extension Router {
    static func log(request: NSURLRequest, data: Data?) {
        #if DEBUG
        print("\n••••••••••••••••••••••••••••••••••••••••••••\n")
        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
            } catch {
                print(error)
            }
        }
        print("\n••••••••••••••••••••••••••••••••••••••••••••\n")
        #endif
    }
}
