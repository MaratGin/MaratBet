//
//  FeedDetailViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 09.05.2022.
//

import UIKit
import Foundation
import SnapKit

class FeedDetailViewController: UIViewController {
    
    // MARK: - Variables
    
    var matchData: SportCell?
    var betInfo: [BetInfo]?
    var bets: [Bet] = []
  
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let bookmaker = betInfo?[0].bookmakers ?? []
        print("sjdfksmdfmsjfnjsdjkfnskjdfjkskjdfjksfjknkdfnknkdsfnjksfjkdskjfkjsnfkk")
        print("sjdfksmdfmsjfnjsdjkfnskjdfjkskjdfjksfjknkdfnknkdsfnjksfjkdskjfkjsnfkk")
        print("sjdfksmdfmsjfnjsdjkfnskjdfjkskjdfjksfjknkdfnknkdsfnjksfjkdskjfkjsnfkk")
        print(bookmaker.count)
        for item in 0..<bookmaker.count {
            if  bookmaker[item].name == "Bwin" {
                bets = bookmaker[item].bets ?? []
            }
        }
        if bets.count == 0 {
            bets = betInfo?[0].bookmakers?[0].bets ?? []
        }
        view.addSubview(tableView)
        setupConstraints()
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(FeedDetailTableViewCell.self, forCellReuseIdentifier: FeedDetailTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none

//        tableView.estimatedRowHeight = 130
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
        print(bets.count)
        
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

}

extension FeedDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedDetailTableViewCell.identifier, for: indexPath) as? FeedDetailTableViewCell else { return UITableViewCell() }
        cell.configureCell(bet: bets[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bets.count
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
}
