//
//  StatisticsDetailTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 27.05.2022.
//

import UIKit

class StatisticsDetailTableViewCell: UITableViewCell {
    static let identifier = "StatisticsDetailTableViewCell"
    let positionLabel = TableLabel()
    let teamImage = UIImageView()
    let teamName = TableLabel()
    let gamesPlayed = TableLabel()
    let wins = TableLabel()
    let lose = TableLabel()
    let draw = TableLabel()
    let diff = TableLabel()
    let points = TableLabel()
    
    // MARK: - Cell initialisation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(positionLabel)
        contentView.addSubview(teamImage)
        contentView.addSubview(teamName)
        contentView.addSubview(gamesPlayed)
        contentView.addSubview(wins)
        contentView.addSubview(lose)
        contentView.addSubview(draw)
        contentView.addSubview(positionLabel)
        contentView.addSubview(diff)
        contentView.addSubview(points)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func setupConstraint() {
        let width = contentView.frame.width / 20
        let value = Int((contentView.frame.width - 10 - 53 - 95 - (width * 6)) / 6)
        positionLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(10)
            make.height.equalToSuperview()
            
        }
        teamImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(positionLabel.snp.trailing).offset(8)
            make.width.equalTo(45)
            make.height.equalTo(45)
        }
        teamName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(teamImage.snp.trailing).offset(5)
            make.width.equalTo(90)
            make.height.equalToSuperview()
        }
        gamesPlayed.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(teamName.snp.trailing).offset(value)
            make.width.equalTo(width)
            make.height.equalToSuperview()
        }
        wins.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(gamesPlayed.snp.trailing).offset(value)
            make.width.equalTo(width)
            make.height.equalToSuperview()
        }
        lose.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(wins.snp.trailing).offset(value)
            make.width.equalTo(width)
            make.height.equalToSuperview()
        }
        draw.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lose.snp.trailing).offset(value)
            make.width.equalTo(width)
            make.height.equalToSuperview()
        }
        diff.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(draw.snp.trailing).offset(value)
            make.width.equalTo(width)
            make.height.equalToSuperview()
        }
        points.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(diff.snp.trailing).offset(value)
            make.width.equalTo(width)
            make.height.equalToSuperview()
        }
        
    }
    
    func configure(team: Standing, row: Int) {
        positionLabel.text = String(team.rank ?? 1)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: team.team?.logo ?? " ") ?? URL(string: "http://assets.stickpng.com/images/58419cf6a6515b1e0ad75a6b.png")! ) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.teamImage.image = image
                    }
                }
            }
        }
        teamName.text = team.team?.name
        gamesPlayed.text = String((team.home?.played ?? 20) + (team.away?.played ?? 20))
        wins.text = String((team.home?.win ?? 20) + (team.away?.win ?? 20))
        lose.text = String((team.home?.lose ?? 20) + (team.away?.lose ?? 20))
        draw.text = String((team.home?.draw ?? 20) + (team.away?.draw ?? 20))
        diff.text = String((team.goalsDiff ?? 20))
        points.text = String((team.points ?? 20))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
