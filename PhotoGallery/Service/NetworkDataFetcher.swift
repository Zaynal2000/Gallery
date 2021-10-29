//
//  NetworkDataFetcher.swift
//  PhotoGallery
//
//  Created by Зайнал Гереев on 25.10.2021.
//

import Foundation

class NetworkDataFetcher {
    
    var networkSevice = NetworkService()
    
    func fetchImages(serchTern: String, completion: @escaping (SearchResults?) -> ()){
        networkSevice.request(searchTer: serchTern) { data, error in
            if let error = error {
                print("Error received requesting data \(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
            
        }
    }
    
    func decodeJSON<T: Decodable> (type: T.Type, from: Data?) -> T? {
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
