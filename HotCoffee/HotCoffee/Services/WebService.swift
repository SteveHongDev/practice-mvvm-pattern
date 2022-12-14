//
//  WebService.swift
//  HotCoffee
//
//  Created by 홍성범 on 2022/10/18.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String {
    case GET
    case POST
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .GET
    var body: Data? = nil
}


class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> ()) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
}
