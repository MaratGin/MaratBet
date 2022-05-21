//
//  FeedDetailTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.05.2022.
//

import Foundation
//
//  FeedViewTableViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import UIKit

class FeedDetailTableViewCell: UITableViewCell {
    
    // MARK: - constants
    
    static let identifier = "FeedDetailTableViewCell"
    
    // MARK: - variables
    
    let bets: [Bet] = []

    // MARK: - UI elements
    
    let matchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
//        view.layer.cornerRadius = 5
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
    
    // MARK: - Cell initialisation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNavigationBar()
       
        contentView.backgroundColor = UIColor(white: 1, alpha: 1)
        contentView.addSubview(matchView)
        matchView.addSubview(additionalView)
        matchView.addSubview(betNameLabel)
        additionalView.addSubview(scrollView)
        scrollView.addSubview(buttonsStackView)
        betNameLabel.font = UIFont(name: "Futura Bold", size: 19)
        betNameLabel.textAlignment = .left
        buttonsStackView.backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupConstraints()
//        scrollView.backgroundColor = .red
//        buttonsStackView.backgroundColor = .red
//        teamAButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
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
    func setupNavigationBar() {
     
    }
    
    // MARK: - Cell configuration
    
    func configureCell(bet: Bet) {
        betNameLabel.text = bet.name
        let count = bet.values?.count ?? 0
        for item in 0..<count {
//            print(bet.name)
//            print("\(bet.values?[item].value) // \(bet.values?[item].odd) ")
            let button = BetButton()
//            let optionNameLabel = UILabel()
//            let valueString = String(bet.values?[item].value)
//            let text =  StringOrDouble.double(<#T##Double#>).
//            optionNameLabel.text = " pred : \(bet.values?[item].odd ?? "1.8")"
//            optionNameLabel.font = UIFont(name: "Futura Bold", size: 2)
//            optionNameLabel.adjustsFontSizeToFitWidth = true
//            optionNameLabel.textAlignment = .center
            let string: String
            switch bet.values?[item].value {
            case .double(let value):
                string  = String(value)
            case .string(let value):
                string = value
            case .none:
                string = ""
            }
            button.setTitle("\(string ) - \(bet.values?[item].odd ?? "1.8")", for: .normal)
//            optionNameLabel.snp.makeConstraints { make in
////                make.trailing.equalToSuperview()
////                make.leading.equalToSuperview()
////                make.height.equalTo(button.frame.height).multipliedBy(0.5)
//                make.centerX.equalToSuperview()
//                make.centerY.equalToSuperview()
//            }
            button.titleLabel?.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(Constants.buttonInsets)
                make.leading.equalToSuperview().inset(Constants.buttonInsets)
                make.centerX.equalToSuperview()
            }
            buttonsStackView.addArrangedSubview(button)
//            buttonsStackView.addSubview(button)
            button.snp.makeConstraints { make in
                make.height.equalToSuperview().multipliedBy(Constants.buttonHeight)
                make.width.equalTo(button.snp.height).multipliedBy(Constants.buttonWidth)
            }
        }
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
//            make.height.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalToSuperview()
        }
        betNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.betNameTop)
            make.leading.equalToSuperview().offset(Constants.betNameLeft)
            make.trailing.equalToSuperview()
//            make.height.lessThanOrEqualTo(matchView.snp.height).multipliedBy(0.2)
            make.height.equalTo(Constants.betNameHeight)
        }
        additionalView.snp.makeConstraints { make in
            make.top.equalTo(betNameLabel.snp.bottom).offset(Constants.viewTopInset)
            make.trailing.equalToSuperview().offset(Constants.addViewTrailing)
            make.leading.equalToSuperview().offset(Constants.addViewTrailing)
//            make.height.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalToSuperview().inset(Constants.addViewBottom)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
                    }
        buttonsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

private struct Constants {
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
