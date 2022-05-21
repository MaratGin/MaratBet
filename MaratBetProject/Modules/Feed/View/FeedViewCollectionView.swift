//
//  FeeedViewCollectionView.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 02.05.2022.
//

import UIKit

class FeedViewCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let sportCells: [Sport] = [
        Sport(name: "Top!", icon: Asset.flame.image, selectedColor: Colors.flameColor, isSelected: false),
        Sport(name: "Football", icon: Asset.football.image, selectedColor: Colors.footballIconColor, isSelected: false),
        Sport(name: "Hockey", icon: Asset.hockey.image, selectedColor: Colors.hockeyIconColor, isSelected: false),
        Sport(name: "BasketBall", icon: Asset.basketball.image, selectedColor: Colors.basketballIconColor, isSelected: false)
    ]
    
   init() {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       super.init(frame: .zero, collectionViewLayout: layout)
       delegate = self
       dataSource = self
       register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sportCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else {
            return UICollectionViewCell()
            
        }
        cell.configure(sport: sportCells[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 60 , height: 20)
//    }
}
