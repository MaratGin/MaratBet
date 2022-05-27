//
//  StatisticsCellTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 26.05.2022.
//

import UIKit

class StatisticsCellCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    static let identifier = "StatisticsCellTableViewCell"
    let imageView = UIImageView()
    let nameLabel = StatisticNameLabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.bringSubviewToFront(nameLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell configuration

    func configure(team: StatisticTeam) {
        imageView.image = team.image
        nameLabel.text = team.name
    }
    
    // MARK: - Constraints

    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    // MARK: - Layout override method

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
      super.apply(layoutAttributes)
      
      let featuredHeight = StatisticsLayoutConstants.Cell.featuredHeight
      let standardHeight = StatisticsLayoutConstants.Cell.standardHeight
      
      let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
      
      let minAlpha: CGFloat = 0.3
      let maxAlpha: CGFloat = 0.75
      
      imageView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
      
      let scale = max(delta, 0.5)
      nameLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
