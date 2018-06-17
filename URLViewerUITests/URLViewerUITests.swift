import XCTest

class URLViewerUITests: XCTestCase {
    var app: XCUIApplication!

        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testDefaultLabelWhenOpenApp() {
        XCTAssert(app.staticTexts["Label"].exists)
    }

    func testLabelTextWhenOpenedByURL() {
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        safari.launch()
        _ = safari.wait(for: .runningForeground, timeout: 30)

        safari.buttons["URL"].tap()
        safari.typeText("urlviewer://example")
        safari.typeText("\n")
        safari.buttons["Open"].tap()

        _ = app.wait(for: .runningForeground, timeout: 5)

        XCTAssert(app.staticTexts["urlviewer://example"].exists)
    }

    
}
