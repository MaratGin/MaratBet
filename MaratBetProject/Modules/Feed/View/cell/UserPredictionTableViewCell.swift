//
//  UserPredictionTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 24.05.2022.
//

import Foundation
import UIKit

class UserPredictionTableViewCell: UITableViewCell {
    
    static let identifier = "userPredictionTableViewCell"
    let sportLabel: UILabel = BetNameLabel()
    let coefLabel: UILabel = BetNameLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(sportLabel)
        contentView.addSubview(coefLabel)
        setupConstraints()
        sportLabel.adjustsFontSizeToFitWidth = true
        coefLabel.adjustsFontSizeToFitWidth = true
    }
  
    func configure(prediction: UserPrediction) {
        if let matchID = prediction.matchID, let teamA = prediction.teamAName, let teamB = prediction.teamBName {
            sportLabel.text = "\(String(describing: matchID)), \(teamA) vs \(teamB)"
            coefLabel.text = prediction.coeficient
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        coefLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
        }
        sportLabel.snp.makeConstraints { make in
            make.centerY.equalTo(coefLabel.snp.centerY)
            make.leading.equalToSuperview()
            make.trailing.equalTo(coefLabel.snp.leading).inset(5)
            make.bottom.equalToSuperview()
        }
    }
}
