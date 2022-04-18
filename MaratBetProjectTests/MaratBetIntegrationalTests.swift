//
//  MaratBetIntegrationalTests.swift
//  MaratBetProjectTests
//
//  Created by Marat Giniyatov on 07.04.2022.
//

import XCTest
@testable import MaratBetProject

final class MaratBetIntegrationalTests: XCTestCase {
    
private var signUpView: SignUpViewController!
private weak var signUpViewModel: SignUpViewModel!
private var signInView: SignInViewController!
private weak var coordinator: SignUpCoordinator!
    private var service: SignUpService!

    // MARK: - SetUp
override func setUpWithError() throws {
    service = SignUpService()
    let coordinator = SignUpCoordinator()
    let signUpViewModel = SignUpViewModel(signUpService: service, coordinator: coordinator)
    signUpView = .init()
    self.signUpViewModel = signUpViewModel
    signUpView.viewModel = signUpViewModel
    self.coordinator = coordinator
}

override func tearDownWithError() throws {
    signUpView = nil
    signInView = nil
}
    
    // MARK: - Tests
    
func testSignUpModuleInit() throws {
    XCTAssertNotNil(signUpView)
    XCTAssertNotNil(signUpViewModel)
}
func testSignUpModuleMemoryLeak() throws {
    signUpView = nil
    XCTAssertNil(signUpViewModel)
    XCTAssertNil(coordinator)
}
func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
}

}
