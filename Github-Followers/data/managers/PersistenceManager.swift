//
//  PersistenceManager.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/23/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

enum PersistenceType{
    case add , remove
}

enum PersistenceManager{
    static let defaults = UserDefaults.standard
    enum Keys{
        static let favorites = "FAVORITES"
    }
    
    static func update(with follower:Follower ,type : PersistenceType , completion : @escaping (ErrorMessage?)->Void){
        retrieveFavorites(completion: {(response) in
            switch response {
            case .success(let favorites) :
                var retrivedfavourites = favorites
                switch type {
                case .add :
                    for favourite in retrivedfavourites{
                        if favourite.login == follower.login {
                            completion(.alreadyInFavourites)
                                                   return
                        }
                    }
                    
                    retrivedfavourites.append(follower)
                case .remove :
                    retrivedfavourites.removeAll {$0.login == follower.login}
                }
                completion(saveFavorites(favorites: retrivedfavourites))
                
                
            case .failure(let error) :
                completion(error)
            }
        }
        )
    }
    
    
    
    
    
    static func retrieveFavorites(completion : @escaping (Result<[Follower],ErrorMessage>)->Void){
        guard let favoriteData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoriteData)
            completion(.success(favorites))
            
        } catch {
            completion(.failure(.unableToFavourite))
            
        }
        
    }
    
    static func saveFavorites(favorites : [Follower] )->ErrorMessage?{
        
        do {
            let encoder = JSONEncoder()
            let encodedFavoritesData = try encoder.encode(favorites)
            defaults.set(encodedFavoritesData, forKey: Keys.favorites)
            return nil
            
            
        } catch {
            return .unableToFavourite
            
        }
    }
    
    
    
    
    
    
}
