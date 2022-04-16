//
//  TapBarViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import UIKit

class TapBarViewController: UITabBarController {
    var tapBarCoordinator: TapBarCoordinator
    var mainCoordinator: MainCoordinator
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    init(tapBarCoordinator: TapBarCoordinator, mainCoordinator: MainCoordinator) {
        self.mainCoordinator = mainCoordinator
        self.tapBarCoordinator = tapBarCoordinator
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        let feedController = FeedViewController()
        feedController.tabBarItem = UITabBarItem(title: "Feed",
                                                 image: UIImage(systemName: "house"),
                                                 tag: 0)
        let profileController = ProfileViewController()
        profileController.tabBarItem = UITabBarItem(title: "profile",
                                                    image: UIImage(systemName: "person"),
                                                 tag: 0)
        let friendsController = FriendsViewController()
        friendsController.tabBarItem = UITabBarItem(title: "friends",
                                                    image: UIImage(systemName: "person.2"),
                                                 tag: 0)
        let balanceController = BalanceViewController()
        balanceController.tabBarItem = UITabBarItem(title: "balance",
                                                    image: UIImage(systemName: "bitcoinsign.circle"),
                                                 tag: 0)
        self.viewControllers = [feedController,profileController,friendsController,balanceController]
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
