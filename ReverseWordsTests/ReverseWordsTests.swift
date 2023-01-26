//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Dmytro Horodyskyi on 19.01.2023.
//

import XCTest
@testable import ReverseWords

final class ReverseWordsTests: XCTestCase {
    
    var reverseManagerTesting: ReverseManager!
    
    override func setUp() {
        super.setUp()
        reverseManagerTesting = ReverseManager()
    }

    override func tearDown() {
        reverseManagerTesting = nil
        super.tearDown()
    }

    func testReverseWordsExceptAlphabeticSymbolsReversedSuccessfuly() {
        
        let testStrings = ["Foxminded cool 24/7" : "dednimxoF looc 24/7",
                          "abcd efgh" : "dcba hgfe",
                          "a1bcd efg!h" : "d1cba hgf!e"]

        for string in testStrings {
            
            let reverseWords = reverseManagerTesting.reverseWordsExceptAlphabeticSymbols(of: string.key)
            XCTAssertEqual(reverseWords, string.value)
            }
        }
    
    func testReverseWordsWithIgnoreSomeCharactersReversedSuccessfuly() {
        
        let testStrings = ["Foxminded cool 24/7" : "dexdnimoF oocl 7/42",
                          "abcd efgh" : "dcba hgfe",
                          "a1bcd efglh" : "dcb1a hgfle"]
        
        for string in testStrings {
            
            let reverseWords = reverseManagerTesting.reverseWords(of: string.key, ignore: "xl")
            XCTAssertEqual(reverseWords, string.value)
        }
    }
}
