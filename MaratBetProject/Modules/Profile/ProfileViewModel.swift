import Foundation

// MARK: - ViewModel's protocol

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
