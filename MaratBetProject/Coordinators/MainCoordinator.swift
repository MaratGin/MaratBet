//
//  MainCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 05.04.2022.
//

import Foundation
import UIKit
// MARK: - Main coordinator
class MainCoordinator: Coordinator {
    enum Route {
        case onboardingScreen
        case tabBar
    }
    private let window: UIWindow
    let navigationController = UINavigationController()

    private lazy var onboardingCoordinator: OnboardingCoordinator = {
       let coordinator = OnboardingCoordinator()
       coordinator.mainCoordinator = self
        return coordinator
    }()
    private lazy var tabBarCoordinator: TabBarCoordinator = {
       let coordinator = TabBarCoordinator(onboardingCoordinator: onboardingCoordinator, mainCoordinator: self)
        return coordinator
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .onboardingScreen:
            setRootViewController(viewController: onboardingCoordinator.configureMainController())
        case .tabBar:
            setRootViewController(viewController: tabBarCoordinator.configureMainController())
        }
    }
    func setRootViewController(viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: 1.0,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}
