//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Josep Cristobal on 8/2/18.
//  Copyright © 2018 Josep Cristobal. All rights reserved.
//

import XCTest
@testable import Westeros
class PersonTests: XCTestCase {
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), description: "Leon rampante")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",
                           url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        lannisterHouse = House(name: "Lannister", sigil: starkSigil, words: "Oye mi rugido",
                               url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "tyrion", alias: "El Enano", house: lannisterHouse)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExintence(){
        
        XCTAssertNotNil(robb)
        
        XCTAssertNotNil(arya)
        
    }
    
    func testFullName(){
        XCTAssertEqual(robb.fullName, "Robb Stark")
        
    }
    
    func testPersonEquality(){
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let enano = Person(name:"tyrion", alias: "El Enano", house: lannisterHouse)
        XCTAssertEqual(enano, tyrion)
        
        //DesIgualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
    
    
}









