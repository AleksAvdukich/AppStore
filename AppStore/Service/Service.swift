//
//  Service.swift
//  AppStore
//
//  Created by Aleksandr Avdukich on 06/10/2019.
//  Copyright © 2019 Aleksandr Avdukich. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service() //singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?)->()) {
        print("Fetching Itunes App from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        
        //получение данных из интернета
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                print("Failed to fetch Apps:", err)
                completion([], nil)
                return
            }
            //success
            //            print(data)
            //            print(String(data: data!, encoding: .utf8))
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            
            
            }.resume() //отправляет запрос
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
//            print(String(data: data!, encoding: .utf8))
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                appGroup.feed.results.forEach({print($0.name)})
                completion(appGroup, nil)
            } catch {
                completion(nil, error)
//                print("Failed to decode:", error)
            }
            
        }.resume()
        
    }
    
}
