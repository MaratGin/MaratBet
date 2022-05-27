//
//  Observable.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 7.03.2022.
//

import Foundation

// MARK: - Binding class

class Observable<T> {
    typealias Listener = (T) -> Void
    private var listener: [Listener] = []
       func bind(_ listener: @escaping Listener) {
           self.listener.append(listener)
       }
       var value: T {
           didSet {
               listener.forEach { $0(value) }
           }
       }
       init(_ val: T) {
           value = val
       }
}
