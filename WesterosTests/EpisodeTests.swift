//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Josep Cristobal on 4/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import XCTest
@testable import Westeros


class EpisodeTests: XCTestCase {
    var one: Seasons!
    var two: Seasons!
    
    var episode1Of1: Episode!
    var episode2Of1:Episode!
    
    var episode1Of2: Episode!
    var episode2Of2: Episode!
    
    
    
    
    override func setUp() {
        super.setUp()
        one = Seasons(name:"Primera temporada (2011)", releaseDate: Date(dateString:"17-04-2011"))
        two = Seasons(name:"Segunda temporada (2012)", releaseDate: Date(dateString:"01-04-2012"))
        
        episode1Of1 = Episode(title: "Winter Is Coming", dateIssue: Date(dateString:"17-04-2011"), season: one)
        episode2Of1 = Episode(title: "The Kingsroad", dateIssue: Date(dateString:"24-04-2011"), season: one)
        
        episode1Of2 = Episode(title: "The North Remembers", dateIssue: Date(dateString:"01-04-2012"), season: two)
        episode2Of2 = Episode(title: "The Night Lands", dateIssue: Date(dateString:"08-04-2012"), season: two)
        
        
    }
    
    func testEpisodeExintence(){
        
        XCTAssertNotNil(episode1Of1)
        
        XCTAssertNotNil(episode2Of2)
        
        XCTAssertNotNil(episode2Of2.season)
    }
    
    func testName(){
        XCTAssertEqual(episode2Of2.fullName, "The Night Lands")
        
    }
    
    func testEpisodeEquality(){
        // Identidad
        XCTAssertEqual(episode2Of2, episode2Of2)
        
        // Igualdad
        let episodePr = Episode(title: "The Night Lands", dateIssue: Date(dateString:"08-04-2012"), season: two)
        XCTAssertEqual(episodePr, episode2Of2)
        
        //DesIgualdad
        XCTAssertNotEqual(episode2Of2, episode1Of2)
        
    }
    func testHashable(){
        XCTAssertNotNil(episode1Of2.hashValue)
        
    }
    
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
