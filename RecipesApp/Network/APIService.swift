//
//  APIService.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 23/02/23.
//

import Foundation

class APIService {
    private let baseUrlString = "http://demo7806414.mockable.io/"
    
    private var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "demo7806414.mockable.io"
        return urlComponents
    }
    
    private func fetchData(with url: URL, completion: @escaping (Data?, URLResponse?, String?) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(nil, nil,String(describing: error))
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(nil, nil, "Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            print("httpResponse, url: \(httpResponse.url?.absoluteString), Status code: \(httpResponse.statusCode)")
            
            guard let data = data else {
                return
            }

            completion(data, response, "Error: \(String(describing: error))")
            
        })
        task.resume()
    }
    
    func fetchRecipes(completion: @escaping (MealResults?, String?) -> Void) {
        var urlComponents = self.urlComponents
        urlComponents.path = "/allRecipes"
        
        guard let url = urlComponents.url else {
            completion(nil, "Error fetching recipes")
            return
        }
        self.fetchData(with: url) { data, response, errorMessage in
            guard let data = data else {
                completion(nil, "Error fetching recipes")
                return
            }
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(MealResults.self, from: data)
                completion(results, nil)
            } catch {
                print("Error decoding Meal Results: \(error)")
                completion(nil, "\(error)")
            }
        }
    }
}
