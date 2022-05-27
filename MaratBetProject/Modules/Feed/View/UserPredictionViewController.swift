//
//  UserPredictionViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 11.05.2022.
//

import UIKit

class UserPredictionViewController: UIViewController {

    let tableView = UITableView()
    var predictions: [UserPrediction] = []
    var submitButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(submitButton)
        view.addSubview(tableView)
        tableView.register(UserPredictionTableViewCell.self, forCellReuseIdentifier: UserPredictionTableViewCell.identifier)
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        setupConstraints()
        view.backgroundColor = .black
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont(name: "Futura Bold", size: 20)
    }
    func setupConstraints() {
        submitButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(submitButton.snp.top).inset(3)
        }
    }
}

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
