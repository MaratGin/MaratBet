//
//  SignUpViewController.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 7.03.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - UI elements
    
    let mainLabel: AuthLabel = {
        let label = AuthLabel()
        label.textColor = Colors.greenColor
        label.textAlignment = .center
        return label
    }()
    var signUpStatusLabel: StatusLabel = {
        let label = StatusLabel()
        label.textColor = .red
        label.text = ""
        label.numberOfLines = 3
        return label
    }()
    let emailContainer = UIView()
    let passwordContainer = UIView()
    let loginContainer = UIView()
    let repasswordContainer = UIView()
    
    var customEmailTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "email..")
        textField.backgroundColor = .clear
        return textField
    }()
    var customLoginTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "login..")
        textField.backgroundColor = .clear
        return textField
    }()
    var customPasswordTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "password..")
        textField.isSecureTextEntry = true
        textField.backgroundColor = .clear
        return textField
    }()
    var customRepasswordTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "re-type password..")
        textField.isSecureTextEntry = true
        textField.backgroundColor = .clear
        return textField
    }()
    
    let loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.person.image
        imageView.tintColor = Colors.greenColor
        return imageView
    }()
    let emailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.envelope.image
        imageView.tintColor = Colors.greenColor
        return imageView
    }()
    let passwordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.key.image
        imageView.tintColor = Colors.greenColor

        return imageView
    }()
    let repasswordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.key.image
        imageView.tintColor = Colors.greenColor

        return imageView
    }()
   
    let signUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("SignIn!", for: .normal)
        button.layer.cornerRadius = 1
        button.layer.borderColor = Colors.greenColor.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    // MARK: - Variables
    
    var viewModel: SignUpViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = Colors.greenColor
        view.backgroundColor = .white
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        setupInterface()
        setupConstraints()
        bindViewModel()
    }
    
    // MARK: - Layout
    
    func setupInterface() {
        emailContainer.addSubview(customEmailTextField)
        emailContainer.addSubview(emailImageView)
        loginContainer.addSubview(customLoginTextField)
        loginContainer.addSubview(loginImageView)
        passwordContainer.addSubview(customPasswordTextField)
        passwordContainer.addSubview(passwordImageView)
        repasswordContainer.addSubview(customRepasswordTextField)
        repasswordContainer.addSubview(repasswordImageView)
        emailContainer.addSeparatorLine(color: Colors.greenColor)
        passwordContainer.addSeparatorLine(color: Colors.greenColor)
        repasswordContainer.addSeparatorLine(color: Colors.greenColor)
        loginContainer.addSeparatorLine(color: Colors.greenColor)
        view.addSubview(emailContainer)
        view.addSubview(loginContainer)
        view.addSubview(passwordContainer)
        view.addSubview(repasswordContainer)
        view.addSubview(mainLabel)
        view.addSubview(signUpStatusLabel)
        view.addSubview(signUpButton)
        view.backgroundColor = .black
    }
    
    // MARK: - Constraints configuration
    
    func setupConstraints() {
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        
        emailContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            make.top.equalToSuperview().offset(150)
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
        loginContainer.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        loginImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
        }
        customLoginTextField.snp.makeConstraints { make in
            make.leading.equalTo(loginImageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(loginContainer.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        passwordImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
        }
        customPasswordTextField.snp.makeConstraints { make in
            make.leading.equalTo(passwordImageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        repasswordContainer.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        repasswordImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
        }
        customRepasswordTextField.snp.makeConstraints { make in
            make.leading.equalTo(repasswordImageView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        signUpStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(repasswordContainer.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
            
        }
    }
    
    // MARK: - Actions
    
    @objc
    func signUpButtonAction() {
      var result =  viewModel?.signUp(login: customLoginTextField.text ?? " ", password: customPasswordTextField.text ?? " ", email: customEmailTextField.text ?? " ", repassword: customRepasswordTextField.text ?? " ")
        result?.toggle()
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
                self.signUpStatusLabel.textColor = .red
            }
        })
        }
}
