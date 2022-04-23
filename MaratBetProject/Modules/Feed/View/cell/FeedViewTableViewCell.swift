//
//  FeedViewTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import UIKit

class FeedViewTableViewCell: UITableViewCell {
    
    // MARK: - constants
    static let identifier = "FeedTableViewCell"
    
    // MARK: - UI elements
    
    let teamALogo: UIImageView = {
        var image = UIImageView()
        image.image = Asset.neymar.image
        return image
    }()
    let teamBLogo: UIImageView = {
        var image = UIImageView()
        image.image = Asset.neymar.image
        return image
    }()
    let teamALabel: UILabel = {
        var label = UILabel()
        return label
    }()
    let teamBLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    let dateLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    let teamAButton: UIButton = {
        var button = UIButton()
        return button
    }()
    let teamBButton: UIButton = {
        var button = UIButton()
        return button
    }()
    let drawButton: UIButton = {
        var button = UIButton()
        return button
    }()
    
    // MARK: - Cell initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(teamALogo)
        contentView.addSubview(teamBLogo)
        contentView.addSubview(teamALabel)
        contentView.addSubview(teamBLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(teamAButton)
        contentView.addSubview(teamBButton)
        contentView.addSubview(drawButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Cell configuration
    
    func configureCell(match: Match) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: match.teams?.home?.logo ?? " ") ?? URL(string: "https://media.api-sports.io/football/teams/71.png")! ) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.teamALogo.image = image
                            }
                        }
                    }
                }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: match.teams?.away?.logo ?? " ") ?? URL(string: "https://media.api-sports.io/football/teams/71.png")! ) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.teamALogo.image = image
                            }
                        }
                    }
                }
        teamALabel.text = match.teams?.home?.name
        teamBLabel.text = match.teams?.away?.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let matchDate = dateFormatter.date(from: match.fixture?.date ?? "21/02/22")
        dateLabel.text = matchDate?.description
        teamAButton.setTitle("П1 = 2", for: .normal)
        teamBButton.setTitle("П1 = 1.7", for: .normal)
        drawButton.setTitle("Х = 3.2", for: .normal)
    }
    
    // MARK: - Constraint Configuration
    
    func setupConstraints() {
        teamALogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(teamALogo.snp.right).offset(30)
            make.top.equalToSuperview().offset(20)
        }
        teamBLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(dateLabel.snp.right).offset(20)
        }
        teamAButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(8)
            make.width.greaterThanOrEqualTo(50)
            make.left.equalToSuperview().offset(10)
        }
        teamBButton.snp.makeConstraints { make in
            make.bottom.equalTo(teamAButton.snp.bottom)
            make.width.greaterThanOrEqualTo(50)
            make.left.equalTo(teamAButton.snp.right).offset(10)
        }
        drawButton.snp.makeConstraints { make in
            make.bottom.equalTo(teamBButton.snp.bottom)
            make.width.greaterThanOrEqualTo(50)
            make.left.equalTo(teamBButton.snp.right).offset(10)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
