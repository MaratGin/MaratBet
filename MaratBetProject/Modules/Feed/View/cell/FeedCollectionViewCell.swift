//
//  FeedCollectionViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 02.05.2022.
//

import UIKit
import SnapKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables

    static let identifier = "feedCollectionViewCell"
    let sportIcon: UIImageView = UIImageView()
    let sportLabel: UILabel = UILabel()
    
    // MARK: - Initialisation

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        addSubview(sportIcon)
        addSubview(sportLabel)
        setupConstraints()
    }
  
    // MARK: - Cell configuration

    func configure(sport: Sport) {
        backgroundColor = .white
        sportLabel.adjustsFontSizeToFitWidth = true
        sportLabel.textAlignment = .center
        sportIcon.image = sport.icon
        sportLabel.text = sport.name
        sportLabel.textColor = .white
        sportLabel.font = UIFont(name: "Futura Bold", size: 9)
        sportIcon.tintColor = .white
        if sport.isSelected {
            sportIcon.tintColor = sport.selectedColor
        } else {
            sportIcon.tintColor = .white
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constants

    func setupConstraints() {
        sportIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
        sportLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(1)
        }
    }
}
