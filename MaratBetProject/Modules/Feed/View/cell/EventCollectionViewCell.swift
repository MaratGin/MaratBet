//
//  EventCollectionViewCell.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 21.05.2022.
//

import UIKit
import SnapKit

protocol SendUserPredictionCollectionDelegate: AnyObject {
    func sendPrediction(prediction: UserPrediction)
}

class EventCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables

    static let identifier = "eventCollectionViewCell"
    weak var delegate: SendUserPredictionCollectionDelegate?

    let eventButton: UIButton = UIButton()
    let nameView: UIView = UIView()
    let eventLabel: UILabel = UILabel()
    let isColored = false
    var coefficient = 2.0
    
    // MARK: - Cell initialisation

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.addSubview(eventButton)
        nameView.addSubview(eventLabel)
        contentView.addSubview(nameView)
        eventButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setupConstraints()
    }
    
    // MARK: - Button Action

    @objc
    func buttonAction() {
        if isColored {
            clearButton(sender: eventButton)
            let value = UserPrediction(coeficient: String(coefficient), teamAName: "", teamBName: "", league: "Premier League", date: "", update: true, event: "", matchID: 1)
            delegate?.sendPrediction(prediction: value)
        }
        
    }
  
    // MARK: - Cell configuration

    func configure(value: Values) {
        print("Config!")
        eventButton.titleLabel?.text = value.odd
        eventButton.backgroundColor = Colors.darkerButtonColor
        eventLabel.font =  UIFont(name: "Futura Bold", size: 12)
        eventLabel.backgroundColor = Colors.buttonColor
            let string: String
            switch value.value {
            case .double(let value):
                string  = String(value)
            case .string(let value):
                string = value
            case .none:
                string = ""
            }
        let valueK = Double(value.odd ?? "22.0") ?? 12.0
        coefficient = valueK
        print("----- --- \(valueK)")
        if valueK <= 4.0 {
            eventButton.setTitleColor(Colors.greenColor, for: .normal)
        }
        if valueK > 4.0 {
            eventButton.setTitleColor(Colors.orangeColor, for: .normal)
        }
        if valueK > 10.0 {
            eventButton.setTitleColor(Colors.redColor, for: .normal)
        }
        eventButton.setTitle(string, for: .normal)
        eventButton.setTitle(value.odd, for: .normal)
        eventLabel.text = string
        eventLabel.textAlignment = .center
        eventLabel.adjustsFontSizeToFitWidth = true
        backgroundColor = .white
    }
    
    // MARK: - method to color button

    func colorButton(sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            sender.backgroundColor =  Colors.chosenButton
            sender.setTitleColor(.white, for: .normal)
        }, completion: nil )
    }
    // MARK: - method to uncolor button

    func clearButton(sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            sender.backgroundColor =  Colors.buttonColor
            sender.setTitleColor(.black, for: .normal)
        }, completion: nil )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints

    func setupConstraints() {
        nameView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(3)
            make.trailing.equalToSuperview()
            make.height.equalTo(15)
        }
        eventLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        eventButton.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom)
            make.leading.equalToSuperview().inset(3)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
