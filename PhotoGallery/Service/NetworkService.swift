//
//  NetworkService.swift
//  PhotoGallery
//
//  Created by Зайнал Гереев on 24.10.2021.
//

import Foundation

class NetworkService {
    
    //опстроение запроса через URL
    func request (searchTer: String, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = self.prepareParameters(searchTerm: searchTer)
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        
    }
    
    private func prepareHeader() -> [String : String]? {
        var headers = [String : String]()
        headers["Authorization"] = "Client-ID E4OttaUfDqFKJ0XnFGi7Ka3tBSPOo_ngJAsSO6mayNY"
        return headers
    }
    
    private func prepareParameters(searchTerm: String?) -> [String : String] {
        var parameters = [String : String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        
        
        return parameters
        
    }
    
    private func url(params: [String : String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping(Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
            
        }
    }
    
}
