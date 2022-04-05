//
//  SignInViewController.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 7.03.2022.
//

import UIKit

class SignInViewController: UIViewController {
      // MARK: - UI elements
    let mainLabel: UILabel = {
        let text = "MaratBet"
        let font = UIFont(name: "Futura Bold", size: 40)
        let color = UIColor.black
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }()
    var signInStatusLabel: UILabel = {
        let text = "MaratBet"
        let font = UIFont(name: "Futura Bold", size: 18)
        let color = UIColor.white
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        label.textAlignment = .center
        return label
    }()
    let loginTextField: UITextField = {
       // let textField = UITextFieldWithPadding(frame: <#CGRect#>)
        let textField = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: " Введите логин", attributes: attributes)
        textField.isSecureTextEntry = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 11)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: " Введите пароль", attributes: attributes)
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8
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
    // MARK: - Variables
    var viewModel: SignInViewModelProtocol?
        override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .white
        signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
//        getBackButton.addTarget(self, action: #selector(getBackButtonAction), for: .touchUpInside)
        setupInterface()
        setupConstraints()
        bindViewModel()
    }
    // MARK: - Layout
    func setupInterface() {
//        view.addSubview(getBackButton)
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
