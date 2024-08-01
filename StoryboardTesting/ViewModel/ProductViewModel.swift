//
//  ProductViewModel.swift
//  StoryboardTesting
//
//  Created by Cynotecck on 17/04/24.
//

import Foundation
import UIKit

class ProductViewModel {
    var ProductImages : [String] = []
    var productLbl : [String] = []
    var allProduct : [ProductModel] = []
 
    init (){
 
        
    }
    
    
    func downloadImages(completion: @escaping ([UIImage?]) -> Void) {
            var downloadedImages: [UIImage?] = []
            let group = DispatchGroup()

            for imageUrlString in ProductImages {
                group.enter()
                guard let imageUrl = URL(string: imageUrlString) else {
                    downloadedImages.append(nil)
                    group.leave()
                    continue
                }

                let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                    defer { group.leave() }
                    guard let data = data, let image = UIImage(data: data) else {
                        downloadedImages.append(nil)
                        return
                    }
                    downloadedImages.append(image)
                }
                task.resume()
            }

            group.notify(queue: DispatchQueue.main) {
                completion(downloadedImages)
            }
        }
    
    
    func fetchDataAndUpdate(completion: @escaping () -> Void) {
            fetchImageApi { result in
                switch result {
                case .success(let models):
                    self.ProductImages = models.map { $0.image }
                    self.productLbl = models.map {$0.title}
                    completion()
                case .failure(let error):
                    print("Error: \(error)")
                    completion()
                }
            }
        }
    func fetchImageApi(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let myModel = try decoder.decode([ProductModel].self, from: data)
                print(myModel)
                self.allProduct = myModel
                
                completion(.success(myModel))
            } catch {
                
                completion(.failure(error))
            }
        }
        
        
        task.resume()
    }
}
