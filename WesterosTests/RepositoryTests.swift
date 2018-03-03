//
//  repositoryTest.swift
//  WesterosTests
//
//  Created by Josep Cristobal on 13/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import XCTest
@testable import Westeros

class repositoryTest: XCTestCase {
    var localHouses: [House]!
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testLocalRepositoryCreation(){
        let local = Repository.local
        XCTAssertNotNil(local)
        
    }
    
    func testLocalRepositoryHousesCreation(){
        //let houses = Repository.local.houses
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnSortedArrayOfHouses() {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnHouseByCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
        
        let otherFilter = Repository.local.houses(filteredBy: {$0.words.contains("invierno")})
        XCTAssertEqual(otherFilter.count, 1)
    
    }
    
    
}
