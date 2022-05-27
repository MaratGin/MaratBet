//
//  AppDelegate.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 06.03.2022.
//
// swiftlint:disable all

import UIKit
import CoreData

@UIApplicationMain

// MARK: - Main screen configuration

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Variables
    
    var mainCoordinator : MainCoordinator?
    var window: UIWindow?
    
    func application
    (_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().tintColor = Colors.goldTabBarItemColor
        UITabBar.appearance().barTintColor = Colors.goldTabBarItemColor
        UITabBar.appearance().unselectedItemTintColor = Colors.whiteColor
        print("ewmkmewm1")
        let  window = UIWindow(frame: UIScreen.main.bounds)
        let mainCoordinator = MainCoordinator(window: window )
        self.window = window
        self.window?.makeKeyAndVisible()
        self.mainCoordinator = mainCoordinator
        print("ewmkmewm1")
        mainCoordinator.navigate(with: .onboardingScreen)
        print("ewmkmewm1")
        
        if #available(iOS 15, *) {
                        let navigationBarAppearance = UINavigationBarAppearance()
                        navigationBarAppearance.configureWithOpaqueBackground()
                        navigationBarAppearance.titleTextAttributes = [
                            NSAttributedString.Key.foregroundColor : UIColor.white
                        ]
                        navigationBarAppearance.backgroundColor = UIColor.black
                        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                    let tabBarApperance = UITabBarAppearance()
                    tabBarApperance.configureWithOpaqueBackground()
                    tabBarApperance.backgroundColor = UIColor.black
                    UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
                    UITabBar.appearance().standardAppearance = tabBarApperance
                }
        return true
    }
}
