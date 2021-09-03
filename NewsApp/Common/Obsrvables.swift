//
//  Obsrvables.swift
//  NewsApp
//


import Foundation

//For binding the generic properties as using MVVM structure
public final class Observable<T> {
    typealias Observer = (T) -> ()
    var observers:[Observer] = []
    var value:T {
        didSet {
            observers.forEach{
                $0(value)
            }
        }
    }
    init(_ value: T) {
        self.value = value
    }
    func bind(_ observer: @escaping Observer) {
        self.observers.append(observer)
    }
}
