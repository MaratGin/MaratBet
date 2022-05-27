//
//  ProfileViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 11.04.2022.
//

import UIKit
import Photos
import PhotosUI

class ProfileViewController: UIViewController {
    
    // MARK: - Variables

    var viewModel: ProfileViewModelProtocol?
    let backgroundProfile = UIView()
    let refreshButton = UIButton()
    let nicknameLabel = ProfileLabel()
    let historyTableView = UITableView()
    let balanceLabel = BalanceLabel()
    let historyLabel = ProfileLabel()
    let email = ProfileLabel()
    var predictions: [UserPrediction] = []
    var chosenImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backgroundProfile.backgroundColor = .black
        refreshButton.setImage(Asset.qrcode.image.withTintColor(.white), for: .normal)
        view.addSubview(refreshButton)
        view.addSubview(historyTableView)
        view.addSubview(backgroundProfile)
        view.addSubview(historyLabel)
        historyLabel.textColor = .black
        historyLabel.textAlignment = .center
        let leaveAcc = UIBarButtonItem(image: Asset.leave.image, style: .done, target: self, action: #selector(leaveAccount))
        leaveAcc.tintColor = .white
        navigationItem.rightBarButtonItem = leaveAcc
        let qrCode = UIBarButtonItem(image: Asset.refresh.image, style: .done, target: self, action: #selector(putTestData))
        qrCode.tintColor = .white
        navigationItem.leftBarButtonItem = qrCode
        backgroundProfile.addSubview(balanceLabel)
        backgroundProfile.addSubview(nicknameLabel)
        setupConstraints()
        putTestData()
        self.navigationItem.titleView = nicknameLabel
    }
    override func viewDidLayoutSubviews() {
        putTestData()
    }
    
    // MARK: - Refresh button action

    @objc
    func putTestData() {
        backgroundProfile.backgroundColor = .black
        nicknameLabel.text = KeychainService.loadLogin()
        nicknameLabel.textColor = .white
        balanceLabel.text = KeychainService.loadbalance()
        nicknameLabel.textAlignment = .center
        historyLabel.text = L10n.betsHistory
    }
    
    // MARK: - Leave account button action

    @objc
    func leaveAccount() {
        viewModel?.leaveAccount()
    }
    
    // MARK: - Constraints

    func setupConstraints() {
        backgroundProfile.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
        balanceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        historyLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundProfile.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(25)
        }
    }
}

// MARK: - TableViewExtension

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserPredictionTableViewCell.identifier, for: indexPath) as? UserPredictionTableViewCell else { return UITableViewCell()
        }
        cell.configure(prediction: predictions[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cellCount \(predictions.count)")
        return predictions.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
