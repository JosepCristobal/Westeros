//
//  Episode.swift
//  Westeros
//
//  Created by Josep Cristobal on 3/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import UIKit

final class Episode {
    let title: String
    let dateIssue: Date
    weak var season: Seasons!
    
    init(title: String, dateIssue: Date, season: Seasons){
        self.title = title
        self.dateIssue = dateIssue
        self.season = season
    }
}
extension Episode{
    //Variable computada
    var fullName: String {
        return "\(title)"
    }
}
// MARK: - Proxies
extension Episode{
    var proxyForEqualityAndC: String{
        return description
    }
   
}
// MARK: - Hashable
extension Episode: Hashable{
    var hashValue: Int{
        return proxyForEqualityAndC.hashValue
    }
}

// MARK: - Equatable
extension Episode: Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool{
        return lhs.proxyForEqualityAndC == rhs.proxyForEqualityAndC
    }
    
    
}
// Mark - Comparable
extension Episode: Comparable{
    static func  < (lhs: Episode, rhs: Episode) -> Bool{
        return lhs.proxyForEqualityAndC < rhs.proxyForEqualityAndC
    }
    
}

// Mark - CustomStringConvertible
extension Episode: CustomStringConvertible{
    var description: String {
        return "\(title) \(dateIssue)"
    }
}




