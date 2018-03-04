//
//  SeasonsTests.swift
//  WesterosTests
//
//  Created by Josep Cristobal on 4/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonsTests: XCTestCase {
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
    
   
    func testSeasonsExintence(){
        
        XCTAssertNotNil(one)
        
        XCTAssertNotNil(two)
        
    }
    
    func testName(){
        XCTAssertEqual(one.name, "Primera temporada (2011)")
        
    }
    
    func testSeasonEquality(){
        // Identidad
        XCTAssertEqual(one, one)
        
        // Igualdad
        let seasonPr = Seasons(name:"Segunda temporada (2012)", releaseDate: Date(dateString:"01-04-2012"))
        XCTAssertEqual(seasonPr, two)
        
        //DesIgualdad
        XCTAssertNotEqual(one, two)
        
    }
    func testHashable(){
        XCTAssertNotNil(one.hashValue)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
