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
    let mainLabel: UILabel = {
        let text = "MaratBet"
        let font = UIFont(name: "Futura Bold", size: 45)
        let color = UIColor.systemYellow
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }()
    let mainImageView: UIImageView = {
        let image = Asset.neymar.image
        let imageView = UIImageView()
        imageView.image = image
        imageView.bounds.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        return imageView
    }()
    let signInButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("SignIn!", for: .normal)
        return button
    }()
    let signUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        button.layer.borderColor  = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("SignUp!", for: .normal)
        return button
    }()
    let buttonsStackView: UIStackView = {
        let buttonView = UIStackView(frame: .zero)
        buttonView.backgroundColor = .white
        buttonView.spacing = 20
        return buttonView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
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
