//
//  NetworkManager.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/15/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class NetworkManager{
    static let sharedNetworkManager=NetworkManager()
    
    private init(){
        
    }
    
    func getFollowers(for userName:String , page:Int ,completion: @escaping (Result<[Follower],ErrorMessage>)->Void){
        let endpoint="/\(userName)/followers?page=\(page)&per_page=100"
        let baseUrlString=Constants.BASE_URL+endpoint
        guard let url=URL(string: baseUrlString) else{
            completion(.failure(.invalidUsername))
            return
        }
        let session=URLSession(configuration: .default)
      let task = session.dataTask(with: url) { data, response, error in
                   
                   if let _ = error {
                       completion(.failure(.unableToComplete))
                    
                       return
                   }
                   
                   guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                       completion(.failure(.invalidResponse))
                   
                       return
                   }
                   
                   guard let data = data else {
                       completion(.failure(.invalidData))
                  
                       return
                   }
                   
                   do {
                       let decoder = JSONDecoder()
                   // decoder.keyDecodingStrategy = .convertFromSnakeCase
                       let followers = try decoder.decode([Follower].self, from: data)
                    completion(.success(followers))
                      
                   } catch {
                       completion(.failure(.invalidData))
                   
                   }
               }
        task.resume()
        
        
        
    }
    func getUserDetails(for userName:String ,completion: @escaping (Result<User,ErrorMessage>)->Void){
          let endpoint="/\(userName)"
          let baseUrlString=Constants.BASE_URL+endpoint
          guard let url=URL(string: baseUrlString) else{
              completion(.failure(.invalidUsername))
              return
          }
          let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
                     
                     if let _ = error {
                         completion(.failure(.unableToComplete))
                      
                         return
                     }
                     
                     guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                         completion(.failure(.invalidResponse))
                     
                         return
                     }
                     
                     guard let data = data else {
                         completion(.failure(.invalidData))
                    
                         return
                     }
                     
                     do {
                         let decoder = JSONDecoder()
                     decoder.keyDecodingStrategy = .convertFromSnakeCase
                         let user = try decoder.decode(User.self, from: data)
                      completion(.success(user))
                        
                     } catch {
                         completion(.failure(.invalidData))
                     
                     }
                 }
          task.resume()
          
          
          
      }
      
}
