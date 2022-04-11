//
//  SignUpViewController.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 7.03.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - UI elements
//    let getBackButton: UIButton = {
//        let button = UIButton(type: .roundedRect)
//        button.setImage(Asset.getBack.image, for: .normal)
//        button.tintColor = .black
//        return button
//    }()
    let mainLabel: AuthLabel = {
        let label = AuthLabel()
        return label
    }()
    var signUpStatusLabel: StatusLabel = {
        let label = StatusLabel()        
        return label
    }()
    let loginTextField: AuthTextField = {
        let textField = AuthTextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray, NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: " Введите логин", attributes: attributes)
        textField.textColor = .black
        return textField
    }()
    let emaiiTextField: AuthTextField = {
        let textField = AuthTextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: " Введите e-mail адрес", attributes: attributes)
        textField.textColor = .black
        return textField
    }()
    let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: " Введите пароль", attributes: attributes)
        textField.isSecureTextEntry = true
        textField.textColor = .black

        return textField
    }()
    let repasswordTextField: AuthTextField = {
        let textField = AuthTextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: " Введите пароль заново", attributes: attributes)
        textField.isSecureTextEntry = true
        textField.textColor = .black
        return textField
    }()
    let signUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("SignIn!", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    // MARK: - Variables
    var viewModel: SignUpViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        setupInterface()
        setupConstraints()
        bindViewModel()
    }
    // MARK: - Layout
    func setupInterface() {
        view.addSubview(mainLabel)
        view.addSubview(signUpStatusLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repasswordTextField)
        view.addSubview(signUpButton)
        view.addSubview(emaiiTextField)
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
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(mainLabel.snp.bottom).offset(60)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        emaiiTextField.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(25)
        }
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(emaiiTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        repasswordTextField.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        signUpStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(repasswordTextField.snp.bottom).offset(40)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(1.0 / 2.5)
            make.centerX.equalTo(self.view)
        }
//        getBackButton.snp.makeConstraints { make in
//            make.width.equalTo(33)
//            make.height.equalTo(33)
//            make.top.equalToSuperview().offset(55)
//            make.left.equalToSuperview().offset(20)
//        }
    }
    // MARK: - Actions
    @objc
    func signUpButtonAction() {
        viewModel?.signUp(login: loginTextField.text ?? " ", password: passwordTextField.text ?? " ", email: emaiiTextField.text ?? " ", repassword: repasswordTextField.text ?? " ")
    }
    @objc
    func getBackButtonAction() {
        viewModel?.goToApp()
    }
    // MARK: - Binding
    func bindViewModel() {
        viewModel?.signUpStatus.bind({ (signUpStatus) in
            DispatchQueue.main.async {
                self.signUpStatusLabel.text = signUpStatus
                self.signUpStatusLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        })
        }
}
