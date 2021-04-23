    //
    //  FollowersVC.swift
    //  Github-Followers
    //
    //  Created by Mahmoud Elattar on 4/12/21.
    //  Copyright © 2021 ITI. All rights reserved.
    //
    
    import UIKit
    protocol nameFollowersVCDelegate: class  {
        func respondTogetFollowers(for userName:String)
    }
    
    
    class FollowersVC: UIViewController {
        var username: String!
        var followerCollectionView:UICollectionView!
        enum Section {case main}
        var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
        var myFollowers=[Follower]()
        var filteredFollowers=[Follower]()
        var isFiltered=false
        
        
        var page :Int!
        var hasMoreFollowers=true
        
        override func viewDidLoad() {
            super.viewDidLoad()
            configureFollowersCollectionView()
            configureVC()
            configureDataSource()
            configureSearchController()
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            page = 1
            getFollowers(for: username, page: page)
            navigationController?.setNavigationBarHidden(false, animated: true)
            
        }
        private func configureVC(){
              title = username
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        private func getFollowers(for username:String, page: Int){
            showLoadingIndicator()
            NetworkManager.sharedNetworkManager.getFollowers(for: username, page: page) { [weak self](result) in
                guard let self=self else{ return}
                self.hideLoadingIndicator()
                switch result{
                case .success(let followers):
                    if followers.count<100{
                        self.hasMoreFollowers=false
                    }
                    self.myFollowers.append(contentsOf: followers)
                    if self.myFollowers.isEmpty {
                        DispatchQueue.main.async {
                            self.showEmptyStateView(with: "This user doesn't have any followers 😃", in: self.view)
                        }
                    }
                    self.updateData(on:self.myFollowers)
                case .failure(let error):
                    self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
                    
                }}
        }
        
    }
    extension FollowersVC{
        private func configureFollowersCollectionView(){
            followerCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
            followerCollectionView.delegate=self
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
        
        
        func updateData(on followers:[Follower]) {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
            snapshot.appendSections([.main])
            snapshot.appendItems(followers)
            DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
        }
    }
    
    extension FollowersVC:UICollectionViewDelegate{
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            let offestY              = scrollView.contentOffset.y
            let contentHeight        = scrollView.contentSize.height
            let screenHeight         = scrollView.frame.height
            let allowableScrolHeight = contentHeight-screenHeight
            if offestY > allowableScrolHeight{ //scrollable indicator move down
                if hasMoreFollowers {
                    page=page+1
                    getFollowers(for: username, page:page)
                }
                
            }
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let targetFollowers = isFiltered ? filteredFollowers :myFollowers
            let userDetailsVC=UserDetailsVC()
             let navController=UINavigationController(rootViewController: userDetailsVC)
            userDetailsVC.userName=targetFollowers[indexPath.item].login
            userDetailsVC.delegate=self
            present(navController, animated: true)
        }
    }
    extension FollowersVC :UISearchResultsUpdating{
        
        func configureSearchController(){                                   
            let searchController                                  = UISearchController()
            searchController.searchResultsUpdater                 = self
            searchController.searchBar.placeholder                = "search for a userName"
            searchController.obscuresBackgroundDuringPresentation = false
            navigationItem.searchController                       = searchController
        }
        func updateSearchResults(for searchController: UISearchController) {
            guard let searchInput=searchController.searchBar.text,!searchInput.isEmpty else {
                isFiltered=false
                self.updateData(on:self.myFollowers)
                return
            }
            
            if searchController.isActive{
                filteredFollowers = myFollowers.filter {$0.login.lowercased().range(of: searchInput.lowercased()) != nil}
                if filteredFollowers.isEmpty {
                    //   self.showEmptyStateView(with: "No folower has a name as input 😀", in:self.view)
                }
                isFiltered=true
                self.updateData(on:self.filteredFollowers)
            }
        }
        
        
    }
    extension FollowersVC : nameFollowersVCDelegate{
        func respondTogetFollowers(for userName: String) {
            self.username = userName
             title = username
             myFollowers.removeAll()
            filteredFollowers.removeAll()
            updateData(on:self.myFollowers)
            followerCollectionView.setContentOffset(.zero, animated: true)
            getFollowers(for: userName, page: page)
        }
        
        
    }
