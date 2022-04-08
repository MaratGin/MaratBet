//
//  MaratBetProjectTests.swift
//  MaratBetProjectTests
//
//  Created by Marat Giniyatov on 05.04.2022.
//

import XCTest
import Moya
@testable import MaratBetProject

class MaratBetProjectTests: XCTestCase {
    private var signUpView: SignUpViewController!
    private var signUpViewModel: SignUpViewModelProtocol!
    private var signInViewModel: SignInViewModel!
    private var networkService: SignInService!
    private var signInView: SignInViewController!
    private var onboardingView: OnboardingViewController!
    private var mainCoordinator: MainCoordinator!
    private var validation: Validation!
    
    override func setUpWithError() throws {
        validation = Validation()
        signUpView = .init()
        signUpViewModel = SignUpViewModel()
        signUpView.viewModel = signUpViewModel
        networkService = SignInService()
        signInView = .init()
        onboardingView = .init()
        signInViewModel = SignInViewModel()
        mainCoordinator = MainCoordinator(window: UIWindow(frame: UIScreen.main.bounds))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        signUpView = nil
        signUpViewModel = nil
        signInView = nil
        networkService = nil
        onboardingView = nil
        mainCoordinator = nil
        signInViewModel = nil
    }

    func testValidationSuccess() throws {
        let email = "email@mail.ru"
        let login = "testlogin1"
        let password = "Marat1"
        let correctResult = true
        let resultEmail = validation.checkEmail(email)
        let resultLogin = validation.checkLogin(login)
        let resultPassword = validation.checkPassword(password)

        XCTAssertEqual(resultEmail, correctResult)
        XCTAssertEqual(resultLogin, correctResult)
        XCTAssertEqual(resultPassword, correctResult)

    }
    
    func testEmailValidationFailure() throws {
        let email = "testemailmail.ru"
        let result = validation.checkEmail(email)
        XCTAssertEqual(result, false)
    }
    func testPasswordValidationFailure() throws {
        let password = "123.ru"
        let result = validation.checkPassword(password)
        XCTAssertEqual(result, false)
    }
    func testSignUpBinding() throws {
        let text = "MaratBet"
        signUpViewModel.signUpStatus.value = text
        let result = signUpView.signUpStatusLabel.text
        XCTAssertEqual(result, text)
    }
    func testSignInBinding() throws {
        let text = "MaratBet"
        signInViewModel.signInStatus.value = text
        let result = signInView.signInStatusLabel.text
        XCTAssertEqual(result, text)
    }
    func testConstraints() throws {
        let signInBtn = onboardingView.signInButton.constraints
        let signUpBtn = onboardingView.signUpButton.constraints
        XCTAssertNotNil(signInBtn, "Nil!")
        XCTAssertNotNil(signUpBtn, "Nil!")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
