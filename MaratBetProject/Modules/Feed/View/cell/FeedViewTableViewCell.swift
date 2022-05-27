//
//  FeedViewTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import UIKit
protocol SendUserPredictionDelegate: AnyObject {
    func sendPrediction(prediction: UserPrediction)
}
class FeedViewTableViewCell: UITableViewCell {
    
    // MARK: - constants
    
    static let identifier = "FeedTableViewCell"
    weak var delegate: SendUserPredictionDelegate?
    var teamAisChosen = false
    var teamBisChosen = false
    var drawIsChosen = false
    var userStatus: Observable<UserPrediction> = Observable(UserPrediction(coeficient: nil, teamAName: nil, teamBName: nil, league: nil, date: nil, update: true, event: nil, matchID: 100))
    var teamACoef = Double(round(Double.random(in: 10..<100) * 10) / 100)
    var teamBCoef = Double(round(Double.random(in: 10..<100) * 10) / 100)
    var drawCoef = Double(round(Double.random(in: 10..<100) * 10) / 100)
    var matchId = 0

    // MARK: - UI elements
    
    let matchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    let teamALogo: UIImageView = {
        var image = UIImageView()
        image.image = Asset.neymar.image
        return image
    }()
    let footballImage = UIImageView(image: Asset.football.image)
    let teamAView = UIView()
    let teamBView = UIView()
    let teamBLogo: UIImageView = {
        var image = UIImageView()
        image.image = Asset.neymar.image
        return image
    }()
    let teamALabel: UILabel = {
        var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 11.0)
        return label
    }()
    let teamBLabel: UILabel = {
        var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 11.0)
        return label
    }()
    let dateLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    let teamAButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = 10
        button.setTitle("П1 =  2", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    let teamBButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    let drawButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    // MARK: - Cell initialisation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(white: 1, alpha: 1)
        matchView.addSubview(teamALogo)
        matchView.addSubview(teamBLogo)
        matchView.addSubview(teamALabel)
        matchView.addSubview(teamBLabel)
        matchView.addSubview(dateLabel)
        matchView.addSubview(teamAButton)
        matchView.addSubview(teamBButton)
        matchView.addSubview(drawButton)
        matchView.addSubview(footballImage)
        contentView.addSubview(matchView)
        contentView.backgroundColor = .clear
        setupConstraints()
        teamAButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        teamBButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        drawButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Cell configuration
    
    func configureCell(match: FootballMatch) {
        matchId = match.fixture?.id ?? 100
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
                        self?.teamBLogo.image = image
                    }
                }
            }
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: match.league?.logo ?? " ") ?? URL(string: "https://media.api-sports.io/football/leagues/39.png")! ) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.footballImage.image = image
                    }
                }
            }
        }
        teamALabel.text = match.teams?.home?.name
        teamBLabel.text = match.teams?.away?.name
        dateLabel.text = DateConfigurator.configureDate(date: match.fixture?.date ?? "2021-01-12T20:15:00+00:00")
        teamAButton.setTitle(" П1 =\(String(teamACoef))", for: .normal)
        teamBButton.setTitle(" П2 =\(String(teamBCoef))", for: .normal)
        drawButton.setTitle(" X =\(String(drawCoef))", for: .normal)
    }
    
    func configureBasketballCell(match: BasketBallMatch) {
        matchId = match.id ?? 100
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
            if let data = try? Data(contentsOf: URL(string: match.teams?.away?.logo ?? " ") ?? URL(string: "http://assets.stickpng.com/images/58419ce2a6515b1e0ad75a69.png")! ) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.teamBLogo.image = image
                    }
                }
            }
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: match.league?.logo ?? " ") ?? URL(string: "http://assets.stickpng.com/images/58419cf6a6515b1e0ad75a6b.png")! ) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.footballImage.image = image
                    }
                }
            }
        }
        teamALabel.text = match.teams?.home?.name
        teamBLabel.text = match.teams?.away?.name
        dateLabel.text = DateConfigurator.configureDate(date: match.date ?? "2021-01-12T20:15:00+00:00")
        teamAButton.setTitle(" П1 =\(String(teamACoef))", for: .normal)
        teamBButton.setTitle(" П2 =\(String(teamBCoef))", for: .normal)
        drawButton.setTitle(" X =\(String(drawCoef))", for: .normal)
    }
    
    func configureHockeyCell(match: HockeyMatch) {
        matchId = match.id ?? 100
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
                        self?.teamBLogo.image = image
                    }
                }
            }
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: match.league?.logo ?? " ") ?? URL(string: "https://media.api-sports.io/football/leagues/39.png")! ) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.footballImage.image = image
                    }
                }
            }
        }
        teamALabel.text = match.teams?.home?.name
        teamBLabel.text = match.teams?.away?.name
        dateLabel.text = DateConfigurator.configureDate(date: match.date ?? "2021-01-12T20:15:00+00:00")
        teamAButton.setTitle(" П1 =  \(String(teamACoef))", for: .normal)
        teamBButton.setTitle(" П2 =  \(String(teamBCoef))", for: .normal)
        drawButton.setTitle(" X =\(String(drawCoef))", for: .normal)
    }
    @objc
    func buttonAction(_ sender: UIButton) {
        switch sender {
        case teamAButton:
            if teamAisChosen {
                teamAisChosen = false
                clearButton(sender: sender)
                let value = UserPrediction(coeficient: String(teamACoef), teamAName: teamALabel.text, teamBName: teamBLabel.text, league: "Premier League", date: dateLabel.text, update: false, event: "", matchID: matchId)
                delegate?.sendPrediction(prediction: value)

            } else {
                colorButton(sender: sender)
                teamBisChosen ? clearButton(sender: teamBButton) : ()
                drawIsChosen ? clearButton(sender: drawButton) : ()
                teamBisChosen = false
                drawIsChosen = false
                teamAisChosen = true
                    let value = UserPrediction(coeficient: String(self.teamACoef), teamAName: self.teamALabel.text, teamBName: self.teamBLabel.text, league: "Premier League", date: self.dateLabel.text, update: true, event: "1st Win", matchID: self.matchId)
                delegate?.sendPrediction(prediction: value)
                
            }
        case teamBButton:
            if teamBisChosen {
                clearButton(sender: sender)
                teamBisChosen = false
                let value = UserPrediction(coeficient: String(teamBCoef), teamAName: teamALabel.text, teamBName: teamBLabel.text, league: "Premier League", date: dateLabel.text, update: false, event: "", matchID: matchId)
                delegate?.sendPrediction(prediction: value)
            } else {
                colorButton(sender: sender)
                teamAisChosen ? clearButton(sender: teamAButton) : ()
                drawIsChosen ? clearButton(sender: drawButton) : ()
                teamAisChosen = false
                drawIsChosen = false
                teamBisChosen = true
                let value = UserPrediction(coeficient: String(teamBCoef), teamAName: teamALabel.text, teamBName: teamBLabel.text, league: "Premier League", date: dateLabel.text, update: true, event: "2nd Win", matchID: matchId)
                delegate?.sendPrediction(prediction: value)

            }
        case drawButton:
            if drawIsChosen {
                clearButton(sender: sender)
                drawIsChosen = false
                let value = UserPrediction(coeficient: String(drawCoef), teamAName: teamALabel.text, teamBName: teamBLabel.text, league: "Premier League", date: dateLabel.text, update: false, event: "", matchID: matchId)
                delegate?.sendPrediction(prediction: value)
            } else {
                colorButton(sender: sender)
                teamAisChosen ? clearButton(sender: teamAButton) : ()
                teamBisChosen ? clearButton(sender: teamBButton) : ()
                teamAisChosen = false
                teamBisChosen = false
                drawIsChosen = true
                let value = UserPrediction(coeficient: String(drawCoef), teamAName: teamALabel.text, teamBName: teamBLabel.text, league: "Premier League", date: dateLabel.text, update: true, event: "draw", matchID: matchId)
                delegate?.sendPrediction(prediction: value)
            }
        default:
            break
        }
    }
    func colorButton(sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            sender.backgroundColor =  Colors.chosenButton
            sender.setTitleColor(.white, for: .normal)
        }, completion: nil )
    }
    func clearButton(sender: UIButton) {
        print("clearing")
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            sender.backgroundColor =  Colors.buttonColor
            sender.setTitleColor(.black, for: .normal)
        }, completion: nil )
    }
    // MARK: - Constraint Configuration
    
    func setupConstraints() {
        
        matchView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(130)
        }
        teamALogo.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(teamALogo.snp.bottom)
        }
        teamBLogo.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(40)
//            make.centerY.equalTo(teamALogo.snp.centerY)
            make.centerY.equalTo(teamALogo.snp.centerY)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        teamAButton.snp.makeConstraints { make in
            make.trailing.equalTo(drawButton.snp.leading).offset(-10)
            make.centerY.equalTo(drawButton.snp.centerY)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.23)

        }
        teamBButton.snp.makeConstraints { make in
            make.leading.equalTo(drawButton.snp.trailing).offset(10)
            make.centerY.equalTo(drawButton.snp.centerY)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.23)

        }
        drawButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.2)
//            make.bottom.equalToSuperview().inset(5)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        teamALabel.snp.makeConstraints { make in
            make.top.equalTo(teamALogo.snp.bottom).offset(5)
            make.centerX.equalTo(teamALogo.snp.centerX)
        }
        teamBLabel.snp.makeConstraints { make in
            make.top.equalTo(teamBLogo.snp.bottom).offset(5)
            make.centerX.equalTo(teamBLogo.snp.centerX)
        }
        footballImage.snp.makeConstraints { make in
            make.centerX.equalTo(dateLabel.snp.centerX)
            make.bottom.equalTo(dateLabel.snp.top).offset(-5)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
