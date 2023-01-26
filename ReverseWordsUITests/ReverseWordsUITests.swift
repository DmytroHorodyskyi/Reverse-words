//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Dmytro Horodyskyi on 20.01.2023.
//

import XCTest

final class ReverseWordsUITests: XCTestCase {

    func testReverseWordsTextInputSuccessfuly() {
 
        let app = XCUIApplication()
        app.launch()
                
        app.textFields["textFieldForReversing"].tap()
        app.textFields["textFieldForReversing"].typeText("Type some text")
        
        app.buttons["Go"].tap()
        app.buttons["showResultButton"].tap()
        
        XCTAssertEqual(
            app.staticTexts.element(matching: .any, identifier: "outputLabel").label,
            "epyT emos txet")
    }
    
    func testReverseWordsLongTextScrollingSuccessfuly() {
        let app = XCUIApplication()
        app.launch()
                
        app.textFields["textFieldForReversing"].tap()
        app.textFields["textFieldForReversing"].typeText("Type some long text that won't fit on one screen")
            
        app.buttons["Go"].tap()
        app.buttons["showResultButton"].tap()
        
        app.scrollViews.containing(.staticText, identifier:"outputLabel").element.swipeLeft()
        XCTAssertTrue(app.scrollViews.containing(.staticText, identifier:"outputLabel").element.exists)
    }
    
    func testReverseWordsChangeButtonTitleSuccessfuly() {
        let app = XCUIApplication()
        app.launch()
                
        app.textFields["textFieldForReversing"].tap()
        app.textFields["textFieldForReversing"].typeText("Type some text")
        
        
        app.buttons["Go"].tap()
        app.buttons["showResultButton"].tap()
                
        
        XCTAssertEqual(app.buttons["showResultButton"].label, "Clear")
    }
}
