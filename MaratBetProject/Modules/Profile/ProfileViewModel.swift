//
//  ProfileViewModel.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 24.05.2022.
//

import Foundation

protocol ProfileViewModelProtocol {
    func leaveAccount()
}

class ProfileViewModel: ProfileViewModelProtocol {
        
    let coordinator: ProfileCoordinator
    
    init(coordinator: ProfileCoordinator ) {
        self.coordinator = coordinator
    }
    func leaveAccount() {
        print("LEaving")
        coordinator.navigate(with: .leave)
    }
}
