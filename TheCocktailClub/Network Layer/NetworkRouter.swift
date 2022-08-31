//
//  NetworkRouter.swift
//  TheCocktailClub
//
//  Created by Aram Ispiryan on 31.08.22.
//

import Foundation

public typealias MainCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkRouter: AnyObject {
    func request(_ route: Endpoint, completion: @escaping MainCompletion)
    func cancel()
}
