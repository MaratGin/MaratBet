//
//  StatisticsViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 26.05.2022.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var leagues: [StatisticTeam] = []
    let collectionView = StatisticsColView()
    var viewModel: StatisticsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        leagues = viewModel?.getAllLeagues() ?? [StatisticTeam(name: L10n.premierLeague, image: Asset.epl.image, leagueID: 39)]
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = .fast
        collectionView.register(StatisticsCellCollectionViewCell.self, forCellWithReuseIdentifier: StatisticsCellCollectionViewCell.identifier)
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension StatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        leagues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StatisticsCellCollectionViewCell.identifier, for: indexPath)
          as? StatisticsCellCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(team: leagues[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        viewModel?.goToDetail(leagueID: leagues[indexPath.row].leagueID ?? 39, row: indexPath.row)
    }

}
class StatisticsColView: UICollectionView {
    init() {
        var preferredStatusBarStyle: UIStatusBarStyle {
          return UIStatusBarStyle.lightContent
        }
        
        let layout = StatisticsLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
