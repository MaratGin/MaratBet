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
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    var signInStatusLabel: AuthLabel = {
        let label = AuthLabel()
        label.text = ""
        label.font = UIFont(name: "Futura Bold", size: 12)
        label.textColor = UIColor.red
        label.numberOfLines = 3
        return label
    }()
    let emailContainer = UIView()
    let passwordContainer = UIView()
    var customEmailTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "login..")
        textField.backgroundColor = .clear
        return textField
    }()
    var customPasswordTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "password..")
        textField.backgroundColor = .clear
        textField.isSecureTextEntry = true
        return textField
    }()
    let emailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.person.image
        imageView.tintColor = Colors.goldTabBarItemColor
        return imageView
    }()
    let passwordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.goldTabBarItemColor
        imageView.image = Asset.key.image
        return imageView
    }()
    let signInButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("SignIn!", for: .normal)
        button.layer.borderColor = Colors.goldTabBarItemColor.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 1
        return button
    }()
    
    // MARK: - ViewDidLoad
    
    var viewModel: SignInViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = Colors.goldTabBarItemColor
        view.backgroundColor = .black
        signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        setupInterface()
        setupConstraints()
        bindViewModel()
    }
    
    // MARK: - Layout
    
    func setupInterface() {
        view.addSubview(signInStatusLabel)
        view.addSubview(signInButton)
        view.addSubview(mainLabel)
        mainLabel.textColor = Colors.goldTabBarItemColor
        emailContainer.addSubview(customEmailTextField)
        emailContainer.addSubview(emailImageView)
        passwordContainer.addSubview(customPasswordTextField)
        passwordContainer.addSubview(passwordImageView)
        emailContainer.addSeparatorLine(color: Colors.goldTabBarItemColor)
        passwordContainer.addSeparatorLine(color: Colors.goldTabBarItemColor)
        view.addSubview(emailContainer)
        view.addSubview(passwordContainer)
    }
    
    // MARK: - Constraints configuration
    
    func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        
        emailContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            make.top.equalToSuperview().offset(200)
        }
        emailImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
        }
        customEmailTextField.snp.makeConstraints { make in
            make.leading.equalTo(emailImageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        passwordImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
        }
        customPasswordTextField.snp.makeConstraints { make in
            make.leading.equalTo(emailImageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(40)
        }
        signInStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    // - MARK: Actions
    
    @objc
    func signInButtonAction() {
        viewModel?.signIn(login: customEmailTextField.text ?? " ", password: customPasswordTextField.text ?? " ")
    }
    
    @objc
    func getBackButtonAction() {
        viewModel?.goToApp()
    }
    // MARK: - Binding
    
    func bindViewModel() {
        viewModel?.signInStatus.bind({ (signInStatus) in
            DispatchQueue.main.async {
                self.signInStatusLabel.textColor = .red
                self.signInStatusLabel.text = signInStatus
            }
        })}
}
