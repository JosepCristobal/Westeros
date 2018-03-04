//
//  Season.swift
//  Westeros
//
//  Created by Josep Cristobal on 3/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

typealias SeasonName = String
typealias Episodes = Set<Episode>

// MARK: - Season
final class Seasons {
    let name: SeasonName
    let releaseDate: Date
    
    private var _episodes: Episodes
    
    init(name: SeasonName, releaseDate: Date)
    {
        self.name = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
}
extension Seasons {
    var count: Int{
        return _episodes.count
    }
    
    var sortedMembers:[Episode]{
        return _episodes.sorted()
        
    }
   
    func add(episode: Episode){
        //guard episode.season == self else{
           // return
        //}
        _episodes.insert(episode)
    }
    
    //func add(episode: Episode...){
      //  episode.forEach{ add(episode: $0)}
    //}
}

// Mark - CustomStringConvertible
extension Seasons: CustomStringConvertible{
    var description: String {
        return "\(name) \(releaseDate)"
    }
}

// MARK: - Proxies
extension Seasons{
    var proxyForEqualityAndC: String{
        return description
    }
    
}
// MARK: - Hashable
extension Seasons: Hashable{
    var hashValue: Int{
        return proxyForEqualityAndC.hashValue
    }
}

// MARK: - Equatable
extension Seasons: Equatable{
    static func ==(lhs: Seasons, rhs: Seasons) -> Bool{
        return lhs.proxyForEqualityAndC == rhs.proxyForEqualityAndC
    }
    
    
}
// Mark - Comparable
extension Seasons: Comparable{
    static func  < (lhs: Seasons, rhs: Seasons) -> Bool{
        return lhs.proxyForEqualityAndC < rhs.proxyForEqualityAndC
    }
    
}


