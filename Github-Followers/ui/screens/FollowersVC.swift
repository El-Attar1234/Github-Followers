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
    enum Section {case main}
     var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var myFollowers=[Follower]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFollowersCollectionView()
        configureVC()
        getFollowers()
      configureDataSource()
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
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
                
            }}
    }
    
}
extension FollowersVC{
    private func configureFollowersCollectionView(){
        followerCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
            view.addSubview(followerCollectionView)
            followerCollectionView.backgroundColor = .systemBackground
        followerCollectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID)
        }
        
        
    /*    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
            let width                       = view.bounds.width
            let padding: CGFloat            = 12
            let minimumItemSpacing: CGFloat = 10
            let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
            let itemWidth                   = availableWidth / 3
            
            let flowLayout                  = UICollectionViewFlowLayout()
            flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
            
            return flowLayout
        }*/
    func configureDataSource() {
               dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: followerCollectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as! FollowerCollectionViewCell
                   cell.set(follower: follower)
                   return cell
               })
           }
           
           
           func updateData() {
               var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
               snapshot.appendSections([.main])
               snapshot.appendItems(myFollowers)
               DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
           }
}

/*extension FollowersVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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
}*/
