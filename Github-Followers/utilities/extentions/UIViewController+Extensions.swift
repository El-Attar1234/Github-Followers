//
//  UIViewController+Extensions.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/13/21.
//  Copyright © 2021 ITI. All rights reserved.
//

//import Foundation



import UIKit
import SafariServices

fileprivate var containerView:UIView!
fileprivate var emptyView:EmptyStateView!
extension UIViewController{
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    func showLoadingIndicator(){
        containerView                 = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha           = 0
        UIView.animate(withDuration: 0.30) { containerView.alpha = 0.8}
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)])
        
        activityIndicator.startAnimating()
    }
    func hideLoadingIndicator(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(with message:String ,in view:UIView) {
         emptyView=EmptyStateView(message: message)
        emptyView.frame = view.bounds
        view.addSubview(emptyView)
    }
    func hideEmptyStateView(with message:String ,in view:UIView) {
        emptyView.removeFromSuperview()
        emptyView=nil
        
    }
    
    func goToSafariService(for url : URL){
        let safariVC=SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .systemOrange
        safariVC.preferredControlTintColor = .systemPurple
        present(safariVC, animated: true)
    }
}
