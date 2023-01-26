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

    func testReverseWordsOneWordReversedSuccessfuly() {
        
        let testString = "Test"
        
        let reverseWords = reverseManagerTesting.reverseWords(of: testString)

        XCTAssertEqual(reverseWords, "tseT")
        }
    
    func testReverseWordsFewWordsReversedSuccessfuly() {
        
        let testString = "I love programming."
        
        let reverseWords = reverseManagerTesting.reverseWords(of: testString)

        XCTAssertEqual(reverseWords, "I evol .gnimmargorp")
    }
}
