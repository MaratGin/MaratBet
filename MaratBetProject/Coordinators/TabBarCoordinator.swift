//
//  TapBarCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
import UIKit
class TabBarCoordinator: Coordinator {
    
    // MARK: - Coordinators variables
    
    lazy var rootViewController = UITabBarController()
    lazy var feedCoordinator = FeedCoordinator(parent: self)
    lazy var friendsCoordinator = FriendsCoordinator(parent: self)
    lazy var profileCoordinator = ProfileCoordinator(parent: self)
    lazy var balanceCoordinator = BalanceCoordinator(parent: self)
    
    // MARK: - Private variables
    
    private var onboardingCoordinator: OnboardingCoordinator
    private var mainCoordinator: MainCoordinator
    
    // MARK: - Initialization
    
    init(onboardingCoordinator: OnboardingCoordinator, mainCoordinator: MainCoordinator ) {
        self.onboardingCoordinator = onboardingCoordinator
        self.mainCoordinator = mainCoordinator
    }
    
    // MARK: - Routes
    
    enum  Route {
        case feed
        case balance
        case profile
        case friends
    }
    
    // MARK: - Navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .feed:
            rootViewController.selectedIndex = 0
        case .balance:
            rootViewController.selectedIndex = 1
        case .profile:
            rootViewController.selectedIndex = 2
        case .friends:
            rootViewController.selectedIndex = 3
        }
    }
    
    // MARK: - TabBar configuration
    
    func configureMainController() -> UIViewController {
        var feedController = feedCoordinator.configureMainController()
        var feedImage = Asset.house.image
        var profileImage = Asset.person.image
        var friendsImage = Asset.person2.image
        var balanceImage = Asset.bitcoinsignCircle.image
        feedController.tabBarItem = UITabBarItem(title: "Feed",
                                                 image: feedImage,
                                                 tag: 0)
        let profileController = profileCoordinator.configureMainController()
        profileController.tabBarItem = UITabBarItem(title: "profile",
                                                    image: profileImage,
                                                    tag: 1)
        let friendsController = friendsCoordinator.configureMainController()
        friendsController.tabBarItem = UITabBarItem(title: "friends",
                                                    image: friendsImage,
                                                    tag: 2)
        let balanceController = balanceCoordinator.configureMainController()
        balanceController.tabBarItem = UITabBarItem(title: "balance",
                                                    image: balanceImage,
                                                    tag: 3)
//        rootViewController.tabBar.backgroundColor = .black
//        rootViewController.editButtonItem.tintColor = Colors.goldTabBarItemColor
//        rootViewController.tabBar.tintColor = Colors.goldTabBarItemColor
//        rootViewController.colo
        rootViewController.viewControllers = [feedController, profileController, friendsController, balanceController]
        navigate(with: .feed)
        return rootViewController
    }
}
