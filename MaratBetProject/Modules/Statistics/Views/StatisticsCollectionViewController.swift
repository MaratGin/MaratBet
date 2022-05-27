//
//  StatisticsCollectionViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 27.05.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class StatisticsCollectionViewController: UICollectionViewController {
    var leagues: [StatisticTeam] = []
    var viewModel: StatisticsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        leagues = viewModel?.getAllLeagues() ?? []
        collectionView.collectionViewLayout = StatisticsLayout()
        self.collectionView!.register(StatisticsCellCollectionViewCell.self, forCellWithReuseIdentifier: StatisticsCellCollectionViewCell.identifier)

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return UIStatusBarStyle.lightContent
    }
    
}

extension StatisticsCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        leagues.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StatisticsCellCollectionViewCell.identifier, for: indexPath)
          as? StatisticsCellCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(team: leagues[indexPath.row])
        return cell
    }
}
