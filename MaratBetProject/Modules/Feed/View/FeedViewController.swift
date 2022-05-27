//
//  FeedViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private enum Constraints {
        static let viewBottomDelimeter = 20.0
        static let viewBottom = 100
        static let viewLeading = 10
        static let viewWidth = 0.7
        static let viewHeight = 0.05
        static let labelLeading = 10
    }

    // MARK: - variables

    let tableView = UITableView()
    let layout = UICollectionViewFlowLayout()
    var collectionView = FeedColView()
    fileprivate var currentData: DataType = .football
    var contentOffSet = 0.0
    let userPredictionViewController = UserPredictionViewController()
    
    var viewModel: FeedViewModelProtocol?
    var sportCells: [Sport] = [
        Sport(name: "Top!", icon: Asset.flame.image, selectedColor: Colors.flameColor, isSelected: false),
        Sport(name: "Football", icon: Asset.football.image, selectedColor: Colors.footballIconColor, isSelected: false),
        Sport(name: "Hockey", icon: Asset.hockey.image, selectedColor: Colors.hockeyIconColor, isSelected: false),
        Sport(name: "BasketBall", icon: Asset.basketball.image, selectedColor: Colors.basketballIconColor, isSelected: false)
    ]
    var footballData: [FootballMatch] = []
    var basketballData: [BasketBallMatch] = []
    var hockeyData: [HockeyMatch] = []
    var currentUserPredictions: [UserPrediction] = []
    
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
    
    // MARK: - VC lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        sleep(1)
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        setNeedsStatusBarAppearanceUpdate()
    }

    override func viewDidLayoutSubviews() {
        let label = UILabel()
        label.textColor = Colors.goldTabBarItemColor
        label.text = L10n.matches
        label.font = UIFont(name: "Futura Bold", size: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(placeBet))
        configureData()
        countLabel.text = L10n.eventS
        coefficientLabel.text = "1.0"
        view.backgroundColor = .systemCyan
        view.backgroundColor = Colors.grayViewColor
        tableView.backgroundColor = Colors.grayViewColor
        bindViewModel()
        view.addSubview(tableView)
        view.addSubview(collectionView)
        view.addSubview(userPredictionView)
        userPredictionView.addSubview(coefficientLabel)
        userPredictionView.addSubview(countLabel)
        userPredictionView.addSubview(predictionsCountLabel)
        view.bringSubviewToFront(userPredictionView)
        userPredictionView.addGestureRecognizer(gesture)
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
        tableView.register(FeedViewTableViewCell.self, forCellReuseIdentifier: FeedViewTableViewCell.identifier)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        collectionView.contentInset = centerItemsInCollectionView(cellWidth: 60, numberOfItems: Double(sportCells.count), spaceBetweenCell: 10, collectionView: collectionView)
        tableView.rowHeight = UITableView.automaticDimension
        view.backgroundColor = .black
    }
    
    // MARK: - constraintConfiguration

    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.lessThanOrEqualTo(Constants.colViewHeight)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(Constants.tabViewTopOffset)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
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
    
    // MARK: - put CollectionView elements in the center
    
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
        let totalWidth = cellWidth * numberOfItems
        let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
        let leftInset = (view.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func updateUserPrediction(prediction: UserPrediction) {
        let doubleCoef = Double(coefficientLabel.text ?? "2.0") ?? 1.0
        var value =  doubleCoef * (Double(prediction.coeficient ?? "2.0") ?? 1.0)
        value = Double(round(value * 1000) / 1000)
        coefficientLabel.text = String(value)
        predictionsCountLabel.text = String(currentUserPredictions.count)
    }
    
    func divideUserPrediction(prediction: UserPrediction) {
        let doubleCoef = Double(coefficientLabel.text ?? "2.0") ?? 1.0
        var value =  doubleCoef / (Double(prediction.coeficient ?? "2.0") ?? 1.0)
        value = Double(round(value * 1000) / 1000)
        coefficientLabel.text = String(value)
        predictionsCountLabel.text = String(currentUserPredictions.count)
        if currentUserPredictions.count == 0 {
            userPredictionView.isHidden = true
            coefficientLabel.text = "1.0"
        }
    }
    
    // MARK: - getData from ViewModel
    
    func configureData() {
        viewModel?.getHockeyMatches(league: Constants.nhlLeague)
        viewModel?.getHockeyMatches(league: 111)
        viewModel?.getFootballMatches(league: Constants.championsLeague)
        viewModel?.getFootballMatches(league: Constants.russianPL)
        viewModel?.getBasketballMatches(league: Constants.nbaLeague)
    }
    
    @objc
    func placeBet() {
        viewModel?.showBetDetail(predictions: currentUserPredictions)
    }
    
    // MARK: - Binding
  
    func bindViewModel() {
        viewModel?.matchStatus.bind({ (loadedData) in
        
            print("binding!")

            DispatchQueue.main.async {
                Swift.print("Sended\(loadedData.count)")
                
                for item in 0..<loadedData.count {
                    switch loadedData[item].type {
                    case "football":
                        self.footballData.append(loadedData[item] as? FootballMatch ?? Constants.footballMatchConst)
                    case "basketball":
                        self.basketballData.append(loadedData[item] as? BasketBallMatch ?? Constants.basketballConst)
                    case "hockey":
                        self.hockeyData.append((loadedData[item] as? HockeyMatch ?? Constants.hockeyMatchConst))
                    default:
                        break
                    }
                }
                if self.hockeyData.count > 1 {
                    self.hockeyData.removeFirst()
                }
                if self.basketballData.count > 1 {
                    self.basketballData.removeFirst()
                }
                for item in 0..<self.sportCells.count {
                    if self.sportCells[item].name == "hockey" {
                        self.sportCells[item].isSelected = true
                    } else {
                        self.sportCells[item].isSelected = false
                    }
                }
                self.currentData = .hockey
                self.sportCells[2].isSelected = true
                self.collectionView.reloadData()
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - UITableView extension 

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewTableViewCell.identifier, for: indexPath) as? FeedViewTableViewCell else { return UITableViewCell() }
        switch currentData {
        case  .football:
            cell.configureCell(match: footballData[indexPath.row])
            cell.delegate = self

        case  .hockey:
            cell.configureHockeyCell(match: hockeyData[indexPath.row])
            cell.delegate = self

        case  .basketball:
            cell.configureBasketballCell(match: basketballData[indexPath.row])
            cell.delegate = self

        default:
            cell.configureCell(match: footballData[indexPath.row])
            cell.delegate = self
        }
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch currentData {
            case  .football:
                return footballData.count
            case  .hockey:
                return hockeyData.count
            case  .basketball:
                return basketballData.count
            default:
                return footballData.count
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch currentData {
        case  .football:
            viewModel?.goToDetail(cell: footballData[indexPath.row], dataType: .football, matchID: footballData[indexPath.row].fixture?.id ?? 100, predictions: currentUserPredictions)
//            BetMoyaConfiguration.
        case  .hockey:
            viewModel?.goToDetail(cell: hockeyData[indexPath.row], dataType: .hockey, matchID: hockeyData[indexPath.row].id ?? 100, predictions: currentUserPredictions)

        case  .basketball:
            viewModel?.goToDetail(cell: basketballData[indexPath.row], dataType: .basketball, matchID: basketballData[indexPath.row].id ?? 100, predictions: currentUserPredictions)
        default:
            viewModel?.goToDetail(cell: footballData[indexPath.row], dataType: .football, matchID: footballData[indexPath.row].fixture?.id ?? 100, predictions: currentUserPredictions)
    }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155.0
    }
}

// MARK: - UICollectionView extension

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.backgroundColor = .yellow
        cell.layer.backgroundColor = UIColor.black.cgColor
        cell.contentView.backgroundColor = .black
        if sportCells[indexPath.row].isSelected {
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                cell.sportIcon.tintColor = self.sportCells[indexPath.row].selectedColor
            }, completion: nil)
        }
        cell.configure(sport: self.sportCells[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sportCells.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(
                width: 60, height: self.collectionView.frame.height)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            sportCells[indexPath.row].isSelected = true
            for item in 0...sportCells.count - 1 where
                sportCells[indexPath.row].name != sportCells[item].name {
                    sportCells[item].isSelected = false
            }
            collectionView.reloadData()
        case 1:
            sportCells[indexPath.row].isSelected = true
            collectionView.reloadData()
            for item in 0...sportCells.count - 1 where
                sportCells[indexPath.row].name != sportCells[item].name {
                    sportCells[item].isSelected = false
            }
            currentData = .football
            tableView.reloadData()
        case 2:
            sportCells[indexPath.row].isSelected = true
            collectionView.reloadData()
            for item in 0...sportCells.count - 1 where
                sportCells[indexPath.row].name != sportCells[item].name {
                    sportCells[item].isSelected = false
            }
            currentData = .hockey
            tableView.reloadData()
        case 3:
            sportCells[indexPath.row].isSelected = true
            collectionView.reloadData()
            for item in 0...sportCells.count - 1 where sportCells[indexPath.row].name != sportCells[item].name {
                    sportCells[item].isSelected = false
            }
            currentData = .basketball
            tableView.reloadData()
        default:
            break
        }
    }
}
class FeedColView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension FeedViewController: SendUserPredictionDelegate {
    func sendPrediction(prediction: UserPrediction) {
            if prediction.update ?? false {
                for item in 0..<currentUserPredictions.count {
                    if prediction.matchID == self.currentUserPredictions[item].matchID {
                        self.currentUserPredictions.remove(at: item)
                        self.divideUserPrediction(prediction: prediction)
                        break
                    }
                }
                self.currentUserPredictions.append(prediction)
                self.updateUserPrediction(prediction: prediction)
                UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                    self.userPredictionView.isHidden = false
                }, completion: nil )
            } else {
                for item in 0..<self.currentUserPredictions.count {
                    print("YEY")
                    if prediction.matchID == self.currentUserPredictions[item].matchID {
                        print("HEYEY")
                        self.currentUserPredictions.remove(at: item)
                        self.divideUserPrediction(prediction: prediction)
                        break
                    }
                }
            }
    }
}

private struct Constants {
   static let footballMatchConst = FootballMatch(fixture: Fixture(id: 12, referee: "1312", timezone: "1211", date: "2022-04-16T14:00:00+00:00", timestamp: 12312, periods: nil, venue: nil, status: nil), league: nil, teams: Teams(home: Home(id: 1, name: "-----", logo: "https://media.api-sports.io/football/teams/71.png", winner: true), away: Away(id: 12, name: "asada2", logo: "https://media.api-sports.io/football/teams/71.png", winner: false)), goals: nil, score: nil)
    static let hockeyMatchConst = HockeyMatch(id: nil, date: "2022-04-16T14:00:00+00:00", time: nil, timestamp: nil, timezone: nil, week: nil, timer: nil, status: nil, country: nil, league: nil, teams: HockeyTeams(home: TeamData(id: 1, name: "Teaam1", logo: "https://media.api-sports.io/football/teams/71.png"), away: TeamData(id: 2, name: "Teaam2", logo: "https://media.api-sports.io/football/teams/71.png")), scores: nil, periods: nil, events: nil, type: "hockey")
    static let basketballConst = BasketBallMatch(type: "basketball", id: 1, date: "2022-04-16T14:00:00+00:00", time: nil, timestamp: nil, timezone: nil, stage: nil, week: nil, status: nil, league: nil, country: nil, teams: HockeyTeams(home: TeamData(id: 1, name: "Team1", logo: "https://media.api-sports.io/football/teams/71.png"), away: TeamData(id: 2, name: "Team2", logo: "https://media.api-sports.io/football/teams/71.png")), scores: nil)
    static let englandPL = 39
    static let championsLeague = 2
    static let europaLeague = 3
    static let seriaA = 135
    static let bundesliga = 79
    static let russianPL = 235
    static let hockeyWC = 111
    static let laLiga = 140
    static let nbaLeague = 12
    static let russiaVTB = 82
    static let nhlLeague = 57
    static let khlLeague = 35
    static let colViewHeight = 55
    static let tabViewTopOffset = 7
}
