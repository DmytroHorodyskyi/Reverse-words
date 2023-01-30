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
        
        let reverseWords = reverseManagerTesting.reverseWordsExceptAlphabeticSymbols(of: "Foxminded cool 24/7")
        XCTAssertEqual(reverseWords, "dednimxoF looc 24/7")
    }
    
    func testReverseWordsWithoutIgnoreCharactersReversedSuccessfuly() {
        
        let reverseWords = reverseManagerTesting.reverseWords(of: "Foxminded cool 24/7", ignore: "")
        XCTAssertEqual(reverseWords, "dednimxoF looc 7/42")
    }
    
    func testReverseWordsWithIgnoreSomeCharactersReversedSuccessfuly() {
                
            let reverseWords = reverseManagerTesting.reverseWords(of: "Foxminded cool 24/7", ignore: "Foxminded")
            XCTAssertEqual(reverseWords, "Foxminded looc 7/42")
    }
}
