//
//  FeedDetailTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.05.2022.
//

import Foundation

import UIKit

class FeedDetailTableViewCell: UITableViewCell {
   
    // MARK: - constants
    
    static let identifier = "FeedDetailTableViewCell"
    
    // MARK: - variables
    
    var bets: [Values] = []
    var collectionView = EventsColView()
    var isButtonHidden = true
    var identifierNumber = 1
    var currentPrediction: [UserPrediction] = []
    
    // MARK: - UI elements
    
    let matchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0
        
        return view
    }()
    let additionalView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        return stackView
    }()
    let scrollView = UIScrollView()
    let betNameLabel = BetNameLabel()
    let hideButton = HideButton()
    
    // MARK: - Cell initialisation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.identifier)
        contentView.backgroundColor = UIColor(white: 1, alpha: 1)
        hideButton.addTarget(self, action: #selector(hideButtonAction), for: .touchUpInside)
        contentView.addSubview(matchView)
        matchView.addSubview(additionalView)
        matchView.addSubview(betNameLabel)
        matchView.addSubview(collectionView)
        matchView.addSubview(hideButton)
        betNameLabel.font = UIFont(name: "Futura Bold", size: 22)
        betNameLabel.textAlignment = .left
        buttonsStackView.backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupConstraints()
        
    }
    
    func makeShadows() {
        contentView.layer.shadowColor = Colors.flameColor.cgColor
        contentView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 0.0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
    @objc
    func hideButtonAction() {
        isButtonHidden.toggle()
        collectionView.reloadData()
    }
    
    // MARK: - Cell configuration
    
    func configureCell(bet: Bet) {
        betNameLabel.text = bet.name
        guard let values = bet.values else { return }
        bets = values
        collectionView.reloadData()
    }
    
    @objc
    func buttonAction(_ sender: UIButton) {

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
            make.top.equalToSuperview().inset(Constants.viewTopInset)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        betNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.betNameTop)
            make.leading.equalToSuperview().offset(Constants.betNameLeft)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(Constants.betNameHeight)
        }
        hideButton.snp.makeConstraints { make in
            make.centerY.equalTo(betNameLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(5)
            make.height.equalTo(betNameLabel.snp.height)
            make.leading.equalTo(betNameLabel.snp.trailing)
            
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(betNameLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

  // MARK: - extension

extension FeedDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.identifier, for: indexPath) as? EventCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.backgroundColor = .clear
        cell.configure(value: self.bets[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if bets.count == 2 {
                let yourWidth = self.collectionView.bounds.width/2.0
                return CGSize(width: yourWidth - 5, height: 40.0)
            }
            if bets.count % 2 == 0 {
                let yourWidth = (self.collectionView.bounds.width -  CGFloat(Constants.spacingBetweenCells * 2))/2.0
                print("width chet \(yourWidth)")
                return CGSize(width: yourWidth, height: 40.0)
            } else {
                let yourWidth = (self.collectionView.bounds.width - CGFloat(Constants.spacingBetweenCells * 3))/3.0
                print("width nechet \(yourWidth)")
                return CGSize(width: yourWidth, height: 40.0)
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}
class EventsColView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = CGFloat(Constants.spacingBetweenCells)
        layout.minimumLineSpacing = CGFloat(Constants.spacingBetweenRows)
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
     }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private struct Constants {
    static let spacingBetweenCells = 3
    static let spacingBetweenRows = 3
    static let viewTopInset = 5
    static let viewBottomInset = 5
    static let addViewTrailing = 5
    static let addViewBottom = 8
    static let betNameHeight = 12
    static let betNameTop = 8
    static let buttonInsets = 5
    static let buttonHeight = 0.8
    static let buttonWidth = 1.5
    static let betNameLeft = 5
}
