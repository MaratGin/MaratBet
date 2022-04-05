//
//  AuthentificationCoordinator.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 16.03.2022.
//

import Foundation
import UIKit
// MARK: - Coordinator for sign up screen
class SignUpCoordinator: Coordinator {
    
    enum Route {
        case signUpScreen
        case appScreen
    }
    // MARK: - Variables
    private let navigationController = UINavigationController()
    // MARK: - coordinator's navigation method
    func navigate(with route: Route) {
        switch route {
        case .signUpScreen:
            let viewController = SignUpViewController()
            viewController.viewModel = SignUpViewModel()
            navigationController.pushViewController(viewController, animated: true)
        case .appScreen:
            break
        }
    }
    func configureViewController(id: Int) -> UIViewController {
            navigate(with: .signUpScreen)
        return navigationController
    }
}
