//
//  APIRequest.swift
//  Meals
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import Foundation

enum HeaderType: String {
    case contentType = "Content-Type"
    case auth = "Authorization"
    case origin = "x-origin"
}

enum ApiType {
    case backend
}

enum HTTPMethodType: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

enum BodyEncoding {
    case jsonSerializationData
    case stringEncodingAscii
}

protocol APIRequest {
    associatedtype Response: Codable

    var apiType: ApiType { get }
    var method: HTTPMethodType { get }
    var path: String { get }
    var bodyEncoding: BodyEncoding { get }
    var headerParamaters: [String: String] { get }
    var bodyParamaters: [String: Any] { get }
    var queryParameters: [String: String] { get }
}

extension APIRequest {
    
    var baseUrl: URL? {
        let baseUrlString: String = {
            switch apiType {
            case .backend:
                return Environment.apiURL
            }
        }()
    
        guard let url = URL(string: baseUrlString) else { return nil }
        return url
    }
    
    var urlRequest: URLRequest? {
        guard let fullURL = self.baseUrl?.appendingPathComponent(self.path) else { return nil }
        
        guard var components = URLComponents(url: fullURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        // Query Params
        if !queryParameters.isEmpty {
            components.queryItems = queryParameters.map {
                URLQueryItem(name: $0, value: $1) }
        }
        
        guard let finalUrl = components.url else {
            return nil
        }
        
        // Request
        var request = URLRequest(url: finalUrl)
        
        // Body Params
        if !bodyParamaters.isEmpty {
            let jsonData = try? JSONSerialization.data(withJSONObject: bodyParamaters, options: .sortedKeys)
            request.httpBody = jsonData
        }
        
        // Method
        request.httpMethod = method.rawValue
        
        // Headers
        if !headerParamaters.isEmpty {
            headerParamaters.forEach { (key, value) in
                request.addValue(key, forHTTPHeaderField: value)
            }
        }
        
        return request
    }
}
