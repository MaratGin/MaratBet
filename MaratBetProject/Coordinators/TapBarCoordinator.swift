//
//  TapBarCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
import UIKit
class TapBarCoordinator: Coordinator {
    private var onboardingCoordinator: OnboardingCoordinator
    private var mainCoordinator: MainCoordinator
    
    init(onboardingCoordinator: OnboardingCoordinator, mainCoordinator: MainCoordinator ) {
        self.onboardingCoordinator = onboardingCoordinator
        self.mainCoordinator = mainCoordinator
    }
    enum  Route {
        case feed
        case balance
        case profile
        case friends
    }
    
    func navigate(with route: Route) {
        switch route {
        case .feed:
            break
        case .balance:
            break
        case .friends:
            break
        case .profile:
            break
        }
    }
    func configureMainController() -> UIViewController {
        let controller = TapBarViewController(tapBarCoordinator: self,mainCoordinator: mainCoordinator)
        return controller
    }
}
