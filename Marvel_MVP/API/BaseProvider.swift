//
//  BaseProvider.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import Combine

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}



class BaseProvider{
    
    func requestGeneric<T: Decodable>(_ entityClass : T.Type,
                                      endpoint: String,
                                      method : HTTPMethod) -> AnyPublisher<T, APIError> {
        
        guard let url = URL(string: endpoint) else {
            preconditionFailure()
        }
        
        let sessionConfig = URLSessionConfiguration.default
        let headers = AppAssembly.defaultHTTPHeaders
        sessionConfig.httpAdditionalHeaders = headers
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return URLSession(configuration: sessionConfig)
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: entityClass.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}

