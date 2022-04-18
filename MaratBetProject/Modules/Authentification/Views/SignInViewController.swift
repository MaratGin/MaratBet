//
//  SignInViewController.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 7.03.2022.
//

import UIKit

class SignInViewController: UIViewController {
      // MARK: - UI elements
    let mainLabel: AuthLabel = {
        let label = AuthLabel()
        return label
    }()
    var signInStatusLabel: AuthLabel = {
        let label = AuthLabel()
        return label
    }()
    let loginTextField: AuthTextField = {
        let textField = AuthTextField()
        let attributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string: " Введите логин",
            attributes: attributes as [NSAttributedString.Key: Any])
        return textField
    }()
    let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        let attributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string: " Введите  пароль",
            attributes: attributes as [NSAttributedString.Key: Any])
        textField.isSecureTextEntry = true
        return textField
    }()
    let signInButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("SignIn!", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - ViewDidLoad
    
    var viewModel: SignInViewModelProtocol?
        override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .white
        signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        setupInterface()
        setupConstraints()
        bindViewModel()
    }
    
    // MARK: - Layout
    
    func setupInterface() {
        view.addSubview(signInStatusLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(mainLabel)
    }
    
    // MARK: - Constraints configuration
    
    func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(200)
            make.centerX.equalTo(self.view)
        }
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(25)

            make.right.equalToSuperview().offset(-40)
            make.top.equalTo(mainLabel.snp.bottom).offset(60)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-40)
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        signInButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        signInStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
//        getBackButton.snp.makeConstraints { make in
//            make.width.equalTo(33)
//            make.height.equalTo(33)
//            make.top.equalToSuperview().offset(55)
//            make.left.equalToSuperview().offset(20)
//        }
    }
    // - MARK: Actions
    @objc
    func signInButtonAction() {
        print("bfahdshbjfbahbh")
        viewModel?.signIn(login: loginTextField.text ?? " ", password: passwordTextField.text ?? " ")
    }
    @objc
    func getBackButtonAction() {
        viewModel?.goToApp()
    }
    // MARK: - Binding
    func bindViewModel() {
        viewModel?.signInStatus.bind({ (signInStatus) in
            DispatchQueue.main.async {
                self.signInStatusLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.signInStatusLabel.text = signInStatus
            }
        })}
}
