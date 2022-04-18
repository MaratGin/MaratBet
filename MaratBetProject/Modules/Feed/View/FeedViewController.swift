//
//  FeedViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - variables

    let tableView = UITableView()
    var viewModel: FeedViewModel?
    var footballData: [Match] = [Match(fixture: Fixture(id: 12, referee: "1312", timezone: "1211", date: "2022-04-16T14:00:00+00:00", timestamp: 12312, periods: nil, venue: nil, status: nil), league: nil, teams: Teams(home: Home(id: 1, name: "abc", logo: "https://media.api-sports.io/football/teams/71.png", winner: true), away: Away(id: 12, name: "vcv", logo: "https://media.api-sports.io/football/teams/71.png", winner: false)), goals: nil, score: nil)]
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        print("---------------------------------------------")
//        viewModel.getFootballMatches()
        bindViewModel()
        view.addSubview(tableView)
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
        tableView.register(FeedViewTableViewCell.self, forCellReuseIdentifier: FeedViewTableViewCell.identifier)
        print("--------------------------------------------- \(footballData.description)")
    }
    
    // MARK: - constraintConfiguration

    func setupConstraints() {
        tableView.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    // MARK: - Binding
    
    func bindViewModel() {
        viewModel?.signInStatus.bind({ (loadedData) in
            DispatchQueue.main.async {
                print("Sended")
                self.footballData = loadedData
                self.tableView.reloadData()
            }
        })}
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewTableViewCell.identifier, for: indexPath) as? FeedViewTableViewCell else { return UITableViewCell() }
        cell.configureCell(match: footballData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return footballData.count
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
