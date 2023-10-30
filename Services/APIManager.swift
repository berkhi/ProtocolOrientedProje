//
//  APIManager.swift
//  ProtocolOrientedProje
//
//  Created by BerkH on 30.10.2023.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping (Result<User, Error>) -> ())
}

class APIManager: UserService {
    
    
    func fetchUser(completion: @escaping (Result<User, Error>) -> ()){
        let url = URL(string:"https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).first {
                    completion(.success(user))
                }else {
                    completion(.failure(NSError()))
                }
            }

        }.resume()
        
    }
    
}
