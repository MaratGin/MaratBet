//
//  BalanceViewModel.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 25.04.2022.
//
import Foundation
import Moya
// MARK: - ViewModel's protocol

protocol BalanceViewModelProtocol {
    func getQuestions()
    var status: Observable<[Question]> { get }
    func updateBalance(balance: String)
}

class BalanceViewModel: BalanceViewModelProtocol {
    // MARK: - Variables

    var coordinator: BalanceCoordinator
    var status: Observable<[Question]>
    var moyaProvider: MoyaProvider<AuthMoyaConfiguration>
    var balanceStatus: Observable<String>
    
    // MARK: - Initialisation

    init(coordinator: BalanceCoordinator ) {
        self.coordinator = coordinator
        self.moyaProvider =  MoyaProvider<AuthMoyaConfiguration>()
        self.status = Observable([Question(image: nil, text: nil, optionA: nil, optionB: nil, optionC: nil, optionD: nil, answer: nil)])
        self.balanceStatus = Observable("100")
    }
    func getQuestions() {
        moyaProvider.request(.getQuestions) { (result) in
            switch result {
            case .success(_):
                let finalData = [Question(image: nil, text: nil, optionA: nil, optionB: nil, optionC: nil, optionD: nil, answer: nil)]
//                do {
//                    //  finalData = try JSONDecoder().decode([Question].self, from: response.data)
//                } catch {
//                    print(Error.self)
//                }
                self.status.value = finalData
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateBalance(balance: String) {
        balanceStatus.value = balance
    }
}
