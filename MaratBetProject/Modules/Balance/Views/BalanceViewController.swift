//
//  BalanceViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import UIKit

class BalanceViewController: UIViewController {
    
    let data = [
        Question(image: Asset.hazard.image, text: "Какой футболист изрбражен на фото?", optionA: "Эрлинг Холанд", optionB: "Мемфис Депай", optionC: "Эден Азар", optionD: "Рис Джеймс", answer: .c),
        Question(image: Asset.pique.image, text: "Какой футболист изрбражен на фото?", optionA: "Жерар Пике", optionB: "Мемфис Депай", optionC: "Эден Азар", optionD: "Рис Джеймс", answer: .a),
        Question(image: Asset.morocco.image, text: "Какой флаг изрбражен на фото?", optionA: "Ангола", optionB: "Нигерия", optionC: "Монголия", optionD: "Морокко", answer: .d),
        Question(image: Asset.nigeria.image, text: "Какой флаг изрбражен на фото?", optionA: "Ангола", optionB: "Нигерия", optionC: "Монголия", optionD: "Морокко", answer: .b)
    ]
    
    let questionLabel: UILabel  = {
        let label = UILabel()
        return label
    }()
    let questionImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    let buttonA: OptionButton = {
        let button = OptionButton()
        return button
    }()
    let buttonB: OptionButton = {
        let button = OptionButton()
        return button
    }()
    let buttonC: OptionButton = {
        let button = OptionButton()
        return button
    }()
    let buttonD: OptionButton = {
        let button = OptionButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buttonA.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonB.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonC.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonD.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    func setupViews() {
        view.addSubview(questionLabel)
        view.addSubview(questionImage)
        view.addSubview(buttonA)
        view.addSubview(buttonB)
        view.addSubview(buttonC)
        view.addSubview(buttonD)
    }
    func setupConstraints() {
        questionImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(questionImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        buttonA.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        buttonB.snp.makeConstraints { make in
            make.top.equalTo(buttonA.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        buttonC.snp.makeConstraints { make in
            make.top.equalTo(buttonB.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        buttonD.snp.makeConstraints { make in
            make.top.equalTo(buttonC.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    func setupQuestion() {
        let question = data[Int.random(in: 0..<4)]
        questionImage.image = question.image
        questionLabel.text = question.text
        buttonC.tag = 13
        buttonA.setTitle(question.optionA, for: .normal)
        buttonB.setTitle(question.optionB, for: .normal)
        buttonC.setTitle(question.optionC, for: .normal)
        buttonD.setTitle(question.optionD, for: .normal)
    }
    
    @objc
    func buttonAction(_ sender: UIButton) {
       
    }
}
