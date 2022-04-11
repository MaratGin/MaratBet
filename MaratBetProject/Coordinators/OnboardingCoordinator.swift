//
//  OnboardingCoordinator.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 16.03.2022.
//

import Foundation
import UIKit
protocol OnboardingCoordinatorProtocol: Coordinator {
}
// MARK: - Coordinator for Onboarding screen
class OnboardingCoordinator: OnboardingCoordinatorProtocol {
    enum Route {
        case onboarding
        case signInScreen
        case signUpScreen
    }
    // MARK: - Variables
    private let navigationController = UINavigationController()
    private lazy var signInCoordinator = SignInCoordinator()
    private lazy var signUpCoordinator = SignUpCoordinator()
    var mainCoordinator: MainCoordinator?
    
    // MARK: - coordinator's navigation method
    func navigate(with route: Route) {
        switch route {
        case .signUpScreen:
            let viewController = SignUpViewController()
            let signUpService = SignUpService()
            signUpCoordinator.mainCoordinator = mainCoordinator
            let viewModel = SignUpViewModel(signUpService: signUpService, coordinator: signUpCoordinator)
            viewController.viewModel = viewModel
            navigationController.pushViewController(viewController, animated: true)
        case .signInScreen:
            let signInService = SignInService()
            let viewController = SignInViewController()
            signInCoordinator.mainCoordinator = mainCoordinator
            viewController.viewModel = SignInViewModel(signInService: signInService, coordinator: signInCoordinator)
            navigationController.pushViewController(viewController, animated: true)
        case .onboarding:
            let viewController = OnboardingViewController()
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    func configureMainController() -> UIViewController {
        navigate(with: .onboarding)
        return navigationController
    }
}
