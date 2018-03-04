//
//  RepositorySeasonsTest.swift
//  WesterosTests
//
//  Created by Josep Cristobal on 4/3/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import XCTest
@testable import Westeros


class RepositorySeasonsTest: XCTestCase {
    var localSeasons: [Seasons]!
    override func setUp() {
        super.setUp()
            localSeasons = RepositorySeasons.localS.seasons
    }
    func testLocalRepositoryCreation(){
        let local = RepositorySeasons.localS
        XCTAssertNotNil(local)
        
    }
    
    func testLocalRepositorySeasonsCreation(){
        
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localSeasons.count, 7)
    }
    
    func testLocalRepositoryReturnSeasonByCaseInsensitively(){
        let oneS = RepositorySeasons.localS.season(named: "SegunDA temporada (2012)")
        XCTAssertEqual(oneS?.name, "Segunda temporada (2012)")
        
        let keepcodingS = RepositorySeasons.localS.season(named: "Keepcoding")
        XCTAssertNil(keepcodingS)
    }
    
    func testHouseFiltering() {
        
        let SeasonsFilter = RepositorySeasons.localS.seasons(filteredBy: {$0.name.contains("Cuarta")})
        XCTAssertEqual(SeasonsFilter.count, 1)
        
    }
    

    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}
