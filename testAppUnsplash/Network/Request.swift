//
//  Request.swift
//  testAppUnsplash
//
//  Created by fedot on 12.01.2022.
//

import Alamofire

protocol ReguestProtocol {
    func getReguest<Model: Codable>(_ url: String, completion: @escaping (Result<Model, Error>) -> Void)
}

struct Reguest: ReguestProtocol {
    func getReguest<Model: Codable>(_ url: String, completion: @escaping (Result<Model, Error>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json",
                                   "Accept-Version": "Accept-Version: v1",
                                   "Accept": "application/json"]
        
        AF.request(url, method: .get, headers: header).validate().responseDecodable(of: Model.self) { data in
            guard let data = data.value else { completion(.failure(data.error!)); return }
            completion(.success(data))
        }
    }
}
