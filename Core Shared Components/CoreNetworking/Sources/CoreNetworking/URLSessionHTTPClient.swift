//
//  URLSessionHTTPClient.swift
//  Core
//
//  Created by TM.Dev on 10/04/2021.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    private struct UnexpectedValuesRepresentation: Error {}

    public func performRequest(
        _ request: URLRequest,
        completion: @escaping (HTTPClient.Result) -> Void
    ) {
        session.dataTask(with: request) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if 
                    let data = data,
                    let response = response as? HTTPURLResponse
                {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }.resume()
    }
}
