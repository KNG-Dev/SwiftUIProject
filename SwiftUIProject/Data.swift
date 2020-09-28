//
//  Data.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 9/28/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI


struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
    
}

class API {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print(err.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                print(posts)
                
                DispatchQueue.global(qos: .background).async {
                    completion(posts)
                }
                
            } catch let parseErr {
                print(parseErr.localizedDescription)
            }
            
        }.resume()
    }
}
