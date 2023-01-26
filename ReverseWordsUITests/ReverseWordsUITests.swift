//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Dmytro Horodyskyi on 20.01.2023.
//

import XCTest

final class ReverseWordsUITests: XCTestCase {

    func testReverseWordsDefaultModeTextInputSuccessfuly() {
 
        let app = XCUIApplication()
        app.launch()
                
        app.textFields["textFieldForReversing"].tap()
        app.textFields["textFieldForReversing"].typeText("Foxminded cool 24/7")
        
        XCTAssertEqual(
            app.staticTexts.element(matching: .any, identifier: "outputLabel").label,
            "dednimxoF looc 24/7")
    }
    
    func testReverseWordsCustomModeTextInputSuccessfuly() {
 
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Custom"].tap()
        app.textFields["textFieldForReversing"].tap()
        app.textFields["textFieldForReversing"].typeText("Foxminded cool 24/7")
        
        app.textFields["Text to ignore"].tap()
        app.textFields["Text to ignore"].typeText("xl")
        
        XCTAssertEqual(
            app.staticTexts.element(matching: .any, identifier: "outputLabel").label,
            "dexdnimoF oocl 7/42")
    }
}
