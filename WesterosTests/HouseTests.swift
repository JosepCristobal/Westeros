//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Josep Cristobal on 8/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), description: "Leon rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",
                            url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        lannisterHouse = House(name: "Lannister", sigil: starkSigil, words: "Oye mi rugido",
                               url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "tyrion", alias: "El Enano", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence(){
        // given
        // when
        //then
        
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    
    func testSigilExistence(){
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        let cerseu = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name:"Jaime", alias: "El Matarreyes", house: lannisterHouse)
        //Añadimos varios simultaneamente
        lannisterHouse.add(persons: cerseu, jaime)
        XCTAssertEqual(lannisterHouse.count,2)
    }
    
    func testHouseEquality(){
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        //Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",
                           url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
         XCTAssertEqual(jinxed, starkHouse)
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
        
    }
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
        
    }
    
    func testHouseReturnsSortedArrayOfMebers(){
        starkHouse.add(persons: robb, arya)
        XCTAssertEqual(starkHouse.sortedMembers, [arya, robb])
    }
    
    
    
}
