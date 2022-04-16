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
    var mainCoordinator: MainCoordinator?

    // MARK: - coordinator's navigation method
    func navigate(with route: Route) {
        switch route {
        case .signUpScreen:
            let viewController = SignUpViewController()
            let signUpService = SignUpService()
            viewController.viewModel = SignUpViewModel(signUpService: signUpService, coordinator: self)
            navigationController.pushViewController(viewController, animated: true)
        case .appScreen:
            print("SignUpCoordinator")
            print(mainCoordinator)
            mainCoordinator?.navigate(with: .tapBar)
            }
    }
    func configureViewController(id: Int) -> UIViewController {
            navigate(with: .signUpScreen)
        return navigationController
    }
}
