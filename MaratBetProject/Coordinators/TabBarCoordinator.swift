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
    lazy var statisticsCoordinator = StatisticsCoordinator(parent: self)
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
        case leave
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
        case .leave:
            mainCoordinator.navigate(with: .leave)
        }
    }
    
    // MARK: - TabBar configuration
    
    func configureMainController() -> UIViewController {
        let feedController = feedCoordinator.configureMainController()
        let feedImage = Asset.house.image
        let profileImage = Asset.person.image
        let statImage = Asset.chart.image
        let balanceImage = Asset.bitcoinsignCircle.image
        feedController.tabBarItem = UITabBarItem(title: "Feed",
                                                 image: feedImage,
                                                 tag: 0)
        let profileController = profileCoordinator.configureMainController()
        profileController.tabBarItem = UITabBarItem(title: "profile",
                                                    image: profileImage,
                                                    tag: 1)
        let friendsController = statisticsCoordinator.configureMainController()
        friendsController.tabBarItem = UITabBarItem(title: "statistics",
                                                    image: statImage,
                                                    tag: 2)
        let balanceController = balanceCoordinator.configureMainController()
        balanceController.tabBarItem = UITabBarItem(title: "balance",
                                                    image: balanceImage,
                                                    tag: 3)
        rootViewController.viewControllers = [feedController, profileController, friendsController, balanceController]
        navigate(with: .feed)
        return rootViewController
    }
}
