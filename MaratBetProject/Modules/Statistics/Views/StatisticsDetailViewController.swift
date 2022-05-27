//
//  StatisticsDetailViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 27.05.2022.
//

import UIKit

class StatisticsDetailViewController: UIViewController {

    var statistics: [Standing] = []
    var viewModel: StatisticsViewModelProtocol?
    var leagueID: Int?
    let tableView = UITableView()
    var row: Int?
    let teamName = TableLabel()
    let gamesPlayed = TableLabel()
    let wins = TableLabel()
    let lose = TableLabel()
    let draw = TableLabel()
    let diff = TableLabel()
    let points = TableLabel()
    let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = UIColor.black
        containerView.backgroundColor = .black
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        containerView.addSubview(points)
        containerView.addSubview(teamName)
        containerView.addSubview(gamesPlayed)
        containerView.addSubview(wins)
        containerView.addSubview(lose)
        containerView.addSubview(draw)
        containerView.addSubview(diff)
        view.addSubview(containerView)
        view.backgroundColor = .white
        teamName.text = "Team name"
        gamesPlayed.text = "GP"
        wins.text = "W"
        lose.text = "L"
        draw.text = "D"
        diff.text = "GD"
        points.text = "PTS"
        tableView.register(StatisticsDetailTableViewCell.self, forCellReuseIdentifier: StatisticsDetailTableViewCell.identifier)
        setupConstraints()
        viewModel?.getStatistic(league: leagueID ?? 39)
        bindViewModel()
    }
    
    func setupConstraints() {
        let width = view.frame.width / 20
        let value = Int((view.frame.width - 10 - 53 - 95 - (width * 6)) / 6)
        print("View = \(width)")
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        teamName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(100)
        }
        gamesPlayed.snp.makeConstraints { make in
            make.leading.equalTo(teamName.snp.trailing).offset(53)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(width)
        }
        wins.snp.makeConstraints { make in
            make.leading.equalTo(gamesPlayed.snp.trailing).offset(value)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(width)
        }
        lose.snp.makeConstraints { make in
            make.leading.equalTo(wins.snp.trailing).offset(value)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(width)
        }
        draw.snp.makeConstraints { make in
            make.leading.equalTo(lose.snp.trailing).offset(value)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(width)
        }
        diff.snp.makeConstraints { make in
            make.leading.equalTo(draw.snp.trailing).offset(value)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(width)
        }
        points.snp.makeConstraints { make in
            make.leading.equalTo(diff.snp.trailing).offset(value)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(width)
        }
    }
    // MARK: - Binding
  
    func bindViewModel() {
        viewModel?.status.bind({ (loadedData) in
            DispatchQueue.main.async {
                for item in 0..<(loadedData[0].league?.standings[0].count ?? 0) {
                    self.statistics.append(loadedData[0].league?.standings[0][item] ?? Standing(rank: nil, team: nil, points: nil, goalsDiff: nil, group: nil, form: nil, status: nil, description: nil, all: nil, home: nil, away: nil, update: nil) )
                }
                self.tableView.reloadData()
            }
        })
        
    }
}
extension StatisticsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatisticsDetailTableViewCell.identifier, for: indexPath) as? StatisticsDetailTableViewCell else { return UITableViewCell() }
        cell.configure(team: statistics[indexPath.row], row: row ?? 0)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {     
        return statistics.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
