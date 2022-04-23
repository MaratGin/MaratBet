//
//  OnboardingViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 05.04.2022.
//
import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    // MARK: - Variables
    var coordinator: OnboardingCoordinator?
    let boxHeight: CGFloat = 130
    // MARK: - UI elements
    let mainLabel: LogoLabel = {
       let label = LogoLabel()
        return label
    }()
    let mainImageView: UIImageView = {
        let image = Asset.neymar.image
        let imageView = UIImageView()
        imageView.image = image
        imageView.bounds.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        return imageView
    }()
    let signInButton: AuthButton = {
        let button = AuthButton()
        button.setTitle("SignIn!", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    let signUpButton: AuthButton = {
        let button = AuthButton()
//        button.layer.borderColor =
        button.backgroundColor = .white
        button.layer.borderColor  = UIColor.black.cgColor
        button.setTitle("SignUp!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        return button
    }()
    let buttonsStackView: ButtonsStackView = {
        let buttonView = ButtonsStackView()
        return buttonView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ewmkmewm")
        signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        setupInterface()
        setupConstraints()

    }
    // MARK: - Layout
    func setupInterface() {
        buttonsStackView.addSubview(signInButton)
        buttonsStackView.addSubview(signUpButton)
        view.addSubview(mainLabel)
        view.addSubview(mainImageView)
        view.addSubview(buttonsStackView)
        view.bringSubviewToFront(buttonsStackView)
        view.bringSubviewToFront(mainLabel)
    }
    // MARK: - Constraints configuration
    func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalTo(self.view)
        }
        signUpButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(1.0 / 2.5)
            make.height.equalTo(60)
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(30)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
            make.width.equalToSuperview().multipliedBy(1.0 / 2.5)
        }
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom)
            make.height.equalTo(boxHeight)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        mainImageView.snp.makeConstraints { make in
            make.bottom.equalTo(buttonsStackView.snp.top)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    // MARK: - Actions
    @objc
    func signInButtonAction() {
        coordinator?.navigate(with: .signInScreen)
    }
    @objc
    func signUpButtonAction() {
        coordinator?.navigate(with: .signUpScreen)
    }
}
