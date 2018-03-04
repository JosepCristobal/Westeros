//
//  Character.swift
//  Westeros
//
//  Created by Josep Cristobal on 8/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house: House
    
    private let _alias: String?
    var alias: String {

        return _alias ?? ""
        
    }
    
    init(name: String, alias: String, house: House){
        self.name = name
       _alias = alias
        self.house = house
    }
    init(name: String, house: House){
        self.name = name
        self.house = house
        _alias = nil
    }
    
    
}
extension Person{
    //Variable computada
    var fullName: String {
        return "\(name) \(house.name)"
    }
}
// MARK: - Proxies
extension Person{
    var proxyForEquality: String{
        return "\(name) \(alias) \(house.name)"
    }
    var proxyforComparision: String {
        return "\(fullName)"
    }
}
// MARK: - Hashable
extension Person: Hashable{
    var hashValue: Int{
        return proxyForEquality.hashValue
    }
}

// MARK: -Equatable
extension Person: Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxyForEquality == rhs.proxyForEquality
    }

    
}
// Mark -Comparable
extension Person: Comparable{
    static func  < (lhs: Person, rhs: Person) -> Bool{
    return lhs.proxyforComparision < rhs.proxyforComparision
    }
    
}

