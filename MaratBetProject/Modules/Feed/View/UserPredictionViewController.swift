//
//  UserPredictionViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 11.05.2022.
//

import UIKit

class UserPredictionViewController: UIViewController {
    
    // MARK: - Variables

    let tableView = UITableView()
    var predictions: [UserPrediction] = []
    var submitButton: UIButton = UIButton()
    var textField: UITextField = UITextField()
    var winView = UIView()
    var container = UIView()
    var potentialWin = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winView.addSubview(potentialWin)
        winView.backgroundColor = .black
        potentialWin.textColor = .white
        container.addSubview(textField)
        container.addSubview(submitButton)
        view.addSubview(winView)
        view.addSubview(container)
        view.addSubview(tableView)
        tableView.register(UserPredictionTableViewCell.self, forCellReuseIdentifier: UserPredictionTableViewCell.identifier)
        submitButton.addTarget(self, action: #selector(placeBet), for: .touchUpInside)
        
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .black
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "Futura Bold", size: 14)
        potentialWin.textColor = .white
        potentialWin.font = UIFont(name: "Futura Bold", size: 13)
        potentialWin.textAlignment = .left
        textField.textColor = .white
        textField.layer.borderWidth = 2
        textField.layer.borderColor = Colors.whiteColor.cgColor
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        setupConstraints()
        
    }
    
    // MARK: - Constraints

    func setupConstraints() {
        container.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(35)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.65)
            make.height.equalTo(50)
        }
        submitButton.snp.makeConstraints { make in
            make.centerY.equalTo(textField.snp.centerY)
            make.leading.equalTo(textField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        winView.snp.makeConstraints { make in
            make.bottom.equalTo(container.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        potentialWin.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(winView.snp.top).inset(3)
        }
    }
    
    // MARK: - Button action

    @objc
    func placeBet() {
        let balance = KeychainService.loadbalance() ?? "0"
        let number =  Int(balance) ?? 100
        let bet = Int(textField.text ?? "1") ?? 0
        if bet > number {
            let alert = UIAlertController(title: L10n.failure, message: L10n.incorrectBetValue, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        } else {
            KeychainService.saveBalance(balance: (number - bet))
            let alert = UIAlertController(title: L10n.succesful🥰, message: L10n.yourBetHasBeenPlaced, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - make textField enter only numbers

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

// MARK: - TableView extension

extension UserPredictionViewController: UITableViewDelegate, UITableViewDataSource {
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
