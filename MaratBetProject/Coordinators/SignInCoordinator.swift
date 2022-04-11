//
//  SignInCoordinator.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 28.03.2022.
//

import Foundation
import UIKit
// MARK: - Coordinator for sign in screen
class SignInCoordinator: Coordinator {
    enum Route {
        case signInScreen
        case appScreen
    }
    // MARK: - Variables
    private let navigationController = UINavigationController()
    var mainCoordinator: MainCoordinator?
    
    func navigate(with route: Route) {
        switch route {
        case .signInScreen:
            let viewController = SignInViewController()
            let signInService = SignInService()
            viewController.viewModel = SignInViewModel(signInService: signInService, coordinator: self)
            navigationController.pushViewController(viewController, animated: true)
        case .appScreen:
            break
        }
    }
    func configureViewController(id: Int) -> UIViewController {
            navigate(with: .signInScreen)
        return navigationController
    }
}
