//
//  FollowersVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/12/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class FollowersVC: UIViewController {
    var username: String!
    var followerCollectionView:UICollectionView!
    var myFollowers=[Follower]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFollowersCollectionView()
        configureVC()
        getFollowers()
        self.title="dddd"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    private func configureVC(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func getFollowers(){
        NetworkManager.sharedNetworkManager.getFollowers(for: username, page: 1) { [weak self](result) in
            guard let self=self else{ return}
            switch result{
            case .success(let followers):
                self.myFollowers=followers
                DispatchQueue.main.async {
                    self.followerCollectionView.reloadData()
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
                
            }}
    }
    
}

extension FollowersVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    private func configureFollowersCollectionView(){
        let flowLayout                         = UICollectionViewFlowLayout()
        followerCollectionView                 =  UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        followerCollectionView.delegate        =  self
        followerCollectionView.dataSource      =  self
        followerCollectionView.backgroundColor = .systemPink
        
        view.addSubview(followerCollectionView)
        followerCollectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
        
        NSLayoutConstraint.activate([
            followerCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            followerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            followerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            followerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFollowers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as! FollowerCollectionViewCell
        cell.set(follower: myFollowers[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 70)
    }
}
