//
//  FeedDetailViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 09.05.2022.
//

import UIKit
import Foundation
import SnapKit

class FeedDetailViewController: UIViewController {
    
    // MARK: - Constraints constants
    
    private enum Constraints {
        static let viewBottomDelimeter = 20.0
        static let viewBottom = 100
        static let viewLeading = 10
        static let viewWidth = 0.7
        static let viewHeight = 0.05
        static let labelLeading = 10
    }
    
    // MARK: - Variables
    
    var matchData: SportCell?
    var betInfo: [BetInfo]?
    var bets: [Bet] = []
    var predictions: [UserPrediction] = []
    let tableView = UITableView()
    let userPredictionView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = Colors.flameColor.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .black
        view.isHidden = true
        return view
    }()
    let coefficientLabel = CoefficientLabel()
    let predictionsCountLabel = CoefficientLabel()
    let countLabel = CoefficientLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = L10n.eventS
        coefficientLabel.text = "1.0"
        view.backgroundColor = .white
        let bookmaker = betInfo?[0].bookmakers ?? []
        print(bookmaker.count)
        for item in 0..<bookmaker.count {
            if  bookmaker[item].name == "Bwin" {
                bets = bookmaker[item].bets ?? []
            }
        }
        if bets.count == 0 {
            bets = betInfo?[0].bookmakers?[0].bets ?? []
        }
        userPredictionView.addSubview(coefficientLabel)
        userPredictionView.addSubview(countLabel)
        userPredictionView.addSubview(predictionsCountLabel)
        view.addSubview(userPredictionView)
        view.addSubview(tableView)
        setupConstraints()
        tableView.separatorStyle = .none
        tableView.register(FeedDetailTableViewCell.self, forCellReuseIdentifier: FeedDetailTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.reloadData()
        print(bets.count)
    }
    
    // MARK: - Constraints
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        userPredictionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constraints.viewBottom)
            make.width.equalToSuperview().multipliedBy(Constraints.viewWidth)
            make.height.equalToSuperview().multipliedBy(Constraints.viewHeight)
        }
        coefficientLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constraints.labelLeading)
            make.top.equalToSuperview()
            make.width.equalTo(50)
            make.bottom.equalToSuperview()
        }
        predictionsCountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(3)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(50)
        }
        countLabel.snp.makeConstraints { make in
            make.trailing.equalTo(predictionsCountLabel.snp.leading).inset(6)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(150)
        }
    }
    
    // MARK: - Button action
    
    @objc
    func hideButtonAction() {
        tableView.reloadData()
    }
}

// MARK: - TableView extension

extension FeedDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedDetailTableViewCell.identifier, for: indexPath) as? FeedDetailTableViewCell else { return UITableViewCell() }
        cell.configureCell(bet: bets[indexPath.row])
        cell.identifierNumber = indexPath.row
        cell.hideButton.addTarget(self, action: #selector(hideButtonAction), for: .touchUpInside)
        
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bets.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let count = bets[indexPath.row].values?.count else {return 2}
        
        if bets[indexPath.row].values?.count ?? 2 == 2 {
            return CGFloat(80)
        }
        if bets[indexPath.row].values?.count ?? 2 == 3 {
            return CGFloat(80)
        }
        if count % 2 == 0 {
            let yourHeight = 40 * (count / 2 )
            print("height chet \(yourHeight) /// \(count)")
            return CGFloat(yourHeight)
        } else {
            let yourHeight = 40 * (count / 3 )
            print("height nechet\(yourHeight) /// \(count)")
            return CGFloat(yourHeight)
        }
    }
}
