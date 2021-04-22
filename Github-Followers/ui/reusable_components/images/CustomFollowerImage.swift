//
//  CustomFollowerImage.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/15/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class CustomFollowerImage: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    let cache=UIHelper.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    func downloadImage(url:String){
        let cacheKey=NSString(string: url)
        if let cachedImage=cache.object(forKey: cacheKey){
            self.image=cachedImage
            return
        }
        
        guard let url=URL(string: url) else{return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
            guard let self=self else{return}
            if let _ = error {return}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return}
            guard let data = data else { return}
            guard  let image=UIImage(data: data)else { return}
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                 self.image=image
            }
           
        }
        task.resume()
    }
    
}
