//
//  Network.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

enum ResultType<T: Decodable> {
    case success(data: T)
    case error(type: NetworkErrorType)
}

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

protocol NetworkProtocol {
    var baseUrl: URL { get }
    var version: String { get }
    var themePath: String { get }
    var url: URL { get }
    func request<T: Decodable>(url: URL) async -> ResultType<T>
}

struct Network: NetworkProtocol {
    let urlSession: URLSession
    let jsonDecoder: JSONDecoder
    
    var baseUrl: URL {
        URL(string: NetworkEnvironment.develop)!
    }
    
    var version: String {
        "V2"
    }
    
    var themePath: String {
        "beers"
    }
    
    var url: URL {
        let urlWithVersion = baseUrl.appendingPathExtension(version)
        let urlWithTheme = urlWithVersion.appendingPathExtension(themePath)
        return urlWithTheme
    }
    
    init(urlSession: URLSession = URLSession.shared, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }
    
    func request<T: Decodable>(url: URL) async -> ResultType<T> {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        
        do {
            let (data, response) = try await urlSession.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkErrorType.undefined
            }
            
            if httpResponse.statusCode < 200 || httpResponse.statusCode > 299 {
                let networkErrorType = NetworkErrorType.type(with: httpResponse.statusCode)
                throw networkErrorType
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .formatted(CustomDateFormatter.dateFormatter)
            let responseBody = try jsonDecoder.decode(T.self, from: data)
            return .success(data: responseBody)
            
        } catch {
            guard let error = error as? NetworkErrorType else {
                return .error(type: NetworkErrorType.undefined)
            }
                
            return .error(type: error)
        }
    }
}
