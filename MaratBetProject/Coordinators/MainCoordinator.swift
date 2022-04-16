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
        case signUpScreen
        case signInScreen
        case tapBar
    }
    private let window: UIWindow
    let navigationController = UINavigationController()
    private lazy var signInCoordinator = SignInCoordinator()
    private lazy var signUpCoordinator = SignUpCoordinator()
    private lazy var onboardingCoordinator = OnboardingCoordinator()
    
    init(window: UIWindow) {
        self.window = window
    }
    // MARK: - Naviagtion method
    func navigate(with route: Route) {
        switch route {
        case .signUpScreen:
            signUpCoordinator.mainCoordinator = self
            setRootViewController(viewController: signUpCoordinator.configureMainController())
        case .signInScreen:
            signInCoordinator.mainCoordinator = self
            setRootViewController(viewController: signInCoordinator.configureMainController())
        case .onboardingScreen:
            onboardingCoordinator.mainCoordinator = self
            setRootViewController(viewController: onboardingCoordinator.configureMainController())
        case .tapBar:
            print("mainCoordinator")
            let tapBarCoordinator = TapBarCoordinator(onboardingCoordinator: onboardingCoordinator, mainCoordinator: self)
            setRootViewController(viewController: tapBarCoordinator.configureMainController())
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
