//
//  NetworkDataFetcher.swift
//  MediaS
//
//  Created by Nikolai Eremenko on 29.06.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (APIResponse?) -> ()) {
        networkService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error! Recived requesting daata: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: APIResponse.self, from: data)
            completion(decode)
            
            
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
    
}
