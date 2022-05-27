//
//  BalanceViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import UIKit

class BalanceViewController: UIViewController {
    
    var viewModel: BalanceViewModelProtocol?
    var data = [
        Question(image: Asset.hazard.image, text: "Какой футболист изрбражен на фото?", optionA: "Эрлинг Холанд", optionB: "Мемфис Депай", optionC: "Эден Азар", optionD: "Рис Джеймс", answer: "c"),
        Question(image: Asset.pique.image, text: "Какой футболист изрбражен на фото?", optionA: "Жерар Пике", optionB: "Мемфис Депай", optionC: "Эден Азар", optionD: "Рис Джеймс", answer: "a"),
        Question(image: Asset.morocco.image, text: "Какой флаг изрбражен на фото?", optionA: "Ангола", optionB: "Нигерия", optionC: "Монголия", optionD: "Морокко", answer: "d"),
        Question(image: Asset.nigeria.image, text: "Какой флаг изрбражен на фото?", optionA: "Ангола", optionB: "Нигерия", optionC: "Монголия", optionD: "Морокко", answer: "b")
    ]
    var questionNumber = 0
    let questionLabel: UILabel  = {
        let label = UILabel()
        label.font = UIFont(name: "Futura Bold", size: 15)
        label.textAlignment = .center
        return label
    }()
    let questionImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    let buttonA = OptionButton()
    let buttonB = OptionButton()
    let buttonC = OptionButton()
    let buttonD = OptionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buttonA.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonB.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonC.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        buttonD.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setupViews()
        setupConstraints()
        setupQuestion()
    }
    
    func setupViews() {
        view.addSubview(questionLabel)
        view.addSubview(questionImage)
        view.addSubview(buttonA)
        view.addSubview(buttonB)
        view.addSubview(buttonC)
        view.addSubview(buttonD)
    }
    
    func bindViewModel() {
        viewModel?.status.bind({ (loadedData) in
            DispatchQueue.main.async {
                self.data = loadedData
            }
        })}
    
    func setupQuestion() {
        usleep(200000)
        UIView.animate(withDuration: 1, delay: .zero, options: .curveEaseIn, animations: {
            self.questionImage.alpha = 0.0
            self.questionLabel.alpha = 0.0
            self.buttonA.alpha = 0.0
            self.buttonB.alpha = 0.0
            self.buttonC.alpha = 0.0
            self.buttonD.alpha = 0.0
        }, completion: { _ in
            self.questionImage.alpha = 1.0
            self.questionLabel.alpha = 1.0
            self.buttonA.alpha = 1.0
            self.buttonB.alpha = 1.0
            self.buttonC.alpha = 1.0
            self.buttonD.alpha = 1.0
        })
        questionNumber = Int.random(in: 0..<4)
        let question = data[questionNumber]
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
        if sender == buttonA {
            
            if data[questionNumber].answer == "a" {
                var value = Int(KeychainService.loadbalance() ?? "1230") ?? 1230
                value += 200
                KeychainService.saveBalance(balance: value)
                UIView.animate(withDuration: 0.5, delay: .zero, options: .curveLinear, animations: {
                    self.buttonA.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    self.buttonA.backgroundColor = .green
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.buttonA.transform = CGAffineTransform.identity
                        self.buttonA.backgroundColor = .white
                        self.setupQuestion()
                    })
                })
            } else {
                UIView.animate(withDuration: 0.2, delay: .zero, options: .curveEaseIn, animations: {
                    self.buttonA.backgroundColor = .red
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.buttonA.backgroundColor = .white
                    })
                })
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.07
                animation.repeatCount = 4
                animation.autoreverses = true
                animation.fromValue = NSValue(cgPoint: CGPoint(x: buttonA.center.x - 10, y: buttonA.center.y))
                animation.toValue = NSValue(cgPoint: CGPoint(x: buttonA.center.x + 10, y: buttonA.center.y))
                buttonA.layer.add(animation, forKey: "position")
                        }
        }
        if sender == buttonB {
            if data[questionNumber].answer == "b" {
                var value = Int(KeychainService.loadbalance() ?? "1230") ?? 1230
                value += 200
                KeychainService.saveBalance(balance: value)
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveLinear, animations: {
                    self.buttonB.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    self.buttonB.backgroundColor = .green
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.buttonB.transform = CGAffineTransform.identity
                        self.buttonB.backgroundColor = .white
                        self.setupQuestion()
                    })
                })
        
            } else {
                UIView.animate(withDuration: 0.2, delay: .zero, options: .curveEaseIn, animations: {
                    self.buttonB.backgroundColor = .red
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.buttonB.backgroundColor = .white
                    })
                })
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.07
                animation.repeatCount = 4
                animation.autoreverses = true
                animation.fromValue = NSValue(cgPoint: CGPoint(x: buttonB.center.x - 10, y: buttonB.center.y))
                animation.toValue = NSValue(cgPoint: CGPoint(x: buttonB.center.x + 10, y: buttonB.center.y))
                buttonB.layer.add(animation, forKey: "position")
                        }
        }
        if sender == buttonC {
            if data[questionNumber].answer == "c" {
                var value = Int(KeychainService.loadbalance() ?? "1230") ?? 1230
                value += 200
                KeychainService.saveBalance(balance: value)
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveLinear, animations: {
                    self.buttonC.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    self.buttonC.backgroundColor = Colors.hexStringToUIColor(hex: "0FEA31")
                }, completion: { _ in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.buttonC.transform = CGAffineTransform.identity
                        self.buttonC.backgroundColor = .white
                        self.setupQuestion()
                    })
                })
                
            } else {
                UIView.animate(withDuration: 0.2, delay: .zero, options: .curveEaseIn, animations: {
                    self.buttonC.backgroundColor = .red
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.buttonC.backgroundColor = .white
                    })
                })
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.07
                animation.repeatCount = 4
                animation.autoreverses = true
                animation.fromValue = NSValue(cgPoint: CGPoint(x: buttonC.center.x - 10, y: buttonC.center.y))
                animation.toValue = NSValue(cgPoint: CGPoint(x: buttonC.center.x + 10, y: buttonC.center.y))
                buttonC.layer.add(animation, forKey: "position")
                        }
        }
        if sender == buttonD {
            if data[questionNumber].answer == "d" {
                var value = Int(KeychainService.loadbalance() ?? "1230") ?? 1230
                value += 200
                KeychainService.saveBalance(balance: value)
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveLinear, animations: {
                    self.buttonD.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    self.buttonD.backgroundColor = Colors.hexStringToUIColor(hex: "#57D738")
                }, completion: { _ in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.buttonD.transform = CGAffineTransform.identity
                        self.buttonD.backgroundColor = .white
                        self.setupQuestion()
                    })
                })
            } else {
                UIView.animate(withDuration: 0.2, delay: .zero, options: .curveEaseIn, animations: {
                    self.buttonD.backgroundColor = .red
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.buttonD.backgroundColor = .white
                    })
                })
                let animation = CABasicAnimation(keyPath: "position")
                animation.duration = 0.07
                animation.repeatCount = 4
                animation.autoreverses = true
                animation.fromValue = NSValue(cgPoint: CGPoint(x: buttonD.center.x - 10, y: buttonD.center.y))
                animation.toValue = NSValue(cgPoint: CGPoint(x: buttonD.center.x + 10, y: buttonD.center.y))
                buttonD.layer.add(animation, forKey: "position")
                        }
        }
    }
    
    func setupConstraints() {
        questionImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(questionImage.snp.bottom).offset(20)
            make.centerX.equalTo(questionImage.snp.centerX)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        buttonA.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(70)
        }
        buttonB.snp.makeConstraints { make in
            make.top.equalTo(buttonA.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(70)
        }
        buttonC.snp.makeConstraints { make in
            make.top.equalTo(buttonB.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(70)
        }
        buttonD.snp.makeConstraints { make in
            make.top.equalTo(buttonC.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(70)
        }
    }
}
