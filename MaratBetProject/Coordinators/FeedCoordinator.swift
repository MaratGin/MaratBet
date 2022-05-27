//
//  FeedCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 17.04.2022.
//

import Foundation
import UIKit
import SnapKit
import FittedSheets

class FeedCoordinator: Coordinator {
    
    // MARK: - Internal variables

    var parentCoordinator: TabBarCoordinator
    
    // MARK: - private variables

    private let navigationController = UINavigationController()
    
    // MARK: Routes
    
    enum  Route {
        case feed
        case detail(matchData: SportCell, bookmaker: [BetInfo], predictions: [UserPrediction])
        case statistics
        case betDetail(predictions: [UserPrediction])
    }
    
    // MARK: - Initialisation

    init(parent: TabBarCoordinator) {
        self.parentCoordinator = parent
    }
    
    // MARK: - Navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .feed:
            let viewController = FeedViewController()
            viewController.viewModel = FeedViewModel(coordinator: self)
            navigationController.pushViewController(viewController, animated: true)
            navigationController.navigationBar.barTintColor = UIColor.black
            navigationController.navigationBar.barStyle = .black
        case .detail(let matchData, let betInfo, let predicions):
            let viewController = FeedDetailViewController()
            viewController.matchData = matchData
            viewController.betInfo = betInfo
            viewController.predictions = predicions
            navigationController.pushViewController(viewController, animated: true)
            navigationController.navigationBar.barTintColor = UIColor.black
            navigationController.navigationBar.barStyle = .black
        case .statistics: break
            
        case .betDetail(let predictions):
            let viewController = UserPredictionViewController()
            viewController.predictions = predictions
            let sheetController = SheetViewController(controller: viewController, sizes: [.intrinsic, .fullscreen])
            navigationController.present(sheetController, animated: true, completion: nil)
        }
            
//            let label = UILabel()
//            label.textColor = UIColor.white
//            label.font = UIFont(name: "Futura Bold", size: 20)
//            navigationController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
//            navigationController.setNeedsStatusBarAppearanceUpdate()
//            let view: UIView  = {
//               let view = UIView()
//                view.backgroundColor = Colors.detailViewBackground
//
//                return view
//            }()
//            navigationController.navigationItem.backBarButtonItem?.customView = view
//            view.snp.makeConstraints { make in
//                make.top.equalToSuperview().offset(5)
//                make.leading.equalToSuperview()
//                make.trailing.equalToSuperview()
//                make.height.equalTo(20)
//            }
       
    }
    
    // MARK: - ViewController configuration

    func configureMainController() -> UIViewController {
        navigate(with: .feed)
        return navigationController
    }
}
