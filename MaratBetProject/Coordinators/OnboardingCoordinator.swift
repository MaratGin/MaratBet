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
    // MARK: - coordinator's navigation method
    func navigate(with route: Route) {
        switch route {
        case .signUpScreen:
            let viewController = SignUpViewController()
            let viewModel = SignUpViewModel()
            viewModel.coordinator = signUpCoordinator
            viewController.viewModel = viewModel
            navigationController.pushViewController(viewController, animated: true)
        case .signInScreen:
            let viewController = SignInViewController()
            viewController.viewModel = SignInViewModel()
            let viewModel = SignInViewModel()
            viewModel.coordinator = signInCoordinator
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
//
//    func moveToSignIn() {
//        let viewController = SignInViewController()
//        viewController.viewModel = SignInViewModel()
//        viewController.coordinator = AuthentificationCoordinator()
//        navigationController.pushViewController(viewController, animated: true)
//    }
//    func moveToSignUp() {
//        let viewController = SignUpViewController()
//        viewController.viewModel = SignUpViewModel()
//        navigationController.pushViewController(viewController, animated: true)
//    }
}
