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
    var mainCoordinator: MainCoordinator?
    private lazy var signInCoordinator: SignInCoordinator = {
       let coordinator = SignInCoordinator()
       coordinator.mainCoordinator = mainCoordinator
        return coordinator
    }()
    private lazy var signUpCoordinator: SignUpCoordinator = {
       let coordinator = SignUpCoordinator()
       coordinator.mainCoordinator = mainCoordinator
        return coordinator
    }()
    
    // MARK: - coordinator's navigation method
    
    func navigate(with route: Route) {
            switch route {
            case .signUpScreen:
                let viewController = SignUpViewController()
                let signUpService = SignUpService()
                let viewModel = SignUpViewModel(signUpService: signUpService, coordinator: signUpCoordinator)
                viewController.viewModel = viewModel
                navigationController.pushViewController(viewController, animated: true)
            case .signInScreen:
                let signInService = SignInService()
                let viewController = SignInViewController()
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

