//
//  RepositorySeasons.swift
//  Westeros
//
//  Created by Josep Cristobal on 3/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import Foundation
final class RepositorySeasons {
    static let localS = LocalFactoryS()
    
    
}

protocol SeasonsFactory {
    typealias  FilterS = (Seasons) -> Bool
    var seasons: [Seasons] { get }
    func season(named: String) -> Seasons?
    func seasons(filteredBy: FilterS ) -> [Seasons]
}

final class LocalFactoryS: SeasonsFactory{
    
    
    var seasons: [Seasons]{
        // Seasons creation here
        let one = Seasons(name:"Primera temporada (2011)", releaseDate: Date(dateString:"17-04-2011"))
        let two = Seasons(name:"Segunda temporada (2012)", releaseDate: Date(dateString:"01-04-2012"))
        let three = Seasons(name:"Tercera temporada (2013)", releaseDate: Date(dateString:"31-03-2013"))
        let four = Seasons(name:"Cuarta temporada (2014)", releaseDate: Date(dateString:"06-04-2014"))
        let five = Seasons(name:"Quinta temporada (2015)", releaseDate: Date(dateString:"12-04-2015"))
        let six = Seasons(name:"Sexta temporada (2016)", releaseDate: Date(dateString:"24-04-2016"))
        let seven = Seasons(name:"Septima temporada (2017)", releaseDate: Date(dateString:"16-07-2017"))
        
        let episode1Of1 = Episode(title: "Winter Is Coming", dateIssue: Date(dateString:"17-04-2011"), season: one)
        let episode2Of1 = Episode(title: "The Kingsroad", dateIssue: Date(dateString:"24-04-2011"), season: one)
        
        let episode1Of2 = Episode(title: "The North Remembers", dateIssue: Date(dateString:"01-04-2012"), season: two)
        let episode2Of2 = Episode(title: "The Night Lands", dateIssue: Date(dateString:"08-04-2012"), season: two)
        
        let episode1Of3 = Episode(title: "Valar Dohaeris", dateIssue: Date(dateString:"31-03-2013"), season: three)
        let episode2Of3 = Episode(title: "Dark Wings, Dark Words", dateIssue: Date(dateString:"07-04-2013"), season: three)
        
        let episode1Of4 = Episode(title: "Two Swords", dateIssue: Date(dateString:"06-04-2014"), season: four)
        let episode2Of4 = Episode(title: "The Lion and the Rose", dateIssue: Date(dateString:"13-04-2014"), season: four)
        
        let episode1Of5 = Episode(title: "The Wars to Come", dateIssue: Date(dateString:"12-04-2015"), season: five)
        let episode2Of5 = Episode(title: "The House of Black and White", dateIssue: Date(dateString:"19-04-2015"), season: five)
        
        let episode1Of6 = Episode(title: "The Red Woman", dateIssue: Date(dateString:"24-04-2016"), season: six)
        let episode2Of6 = Episode(title: "Home", dateIssue: Date(dateString:"01-05-2016"), season: six)
        
        let episode1Of7 = Episode(title: "Dragonstone", dateIssue: Date(dateString:"16-07-2017"), season: seven)
        let episode2Of7 = Episode(title: "Stormborn", dateIssue: Date(dateString:"23-07-2017"), season: seven)
        
        //Add Episodes to Seasons
        
        one.add(episode: episode1Of1)
        one.add(episode: episode2Of1)
        two.add(episode: episode1Of2)
        two.add(episode: episode2Of2)
        three.add(episode: episode1Of3)
        three.add(episode: episode2Of3)
        four.add(episode: episode1Of4)
        four.add(episode: episode2Of4)
        five.add(episode: episode1Of5)
        five.add(episode: episode2Of5)
        six.add(episode: episode1Of6)
        six.add(episode: episode2Of6)
        seven.add(episode: episode1Of7)
        seven.add(episode: episode2Of7)
        
        return [one,two,three,four,five,six,seven]
    }
    
    func season(named name: String) -> Seasons? {
        let season = seasons.filter{$0.name.uppercased() == name.uppercased()}.first
        //let house = houses.filter{$0.name.uppercased() == name.uppercased()}
        return season
    }
    
    func seasons(filteredBy: FilterS) -> [Seasons] {
        return seasons.filter(filteredBy)
    }
   
    
}

extension Date{
    init(dateString:String){
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd-MM-yyyy"
        dateStringFormatter.locale = Locale(identifier: "es_ES")
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
}
    

