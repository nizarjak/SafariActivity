import UIKit
import XCTest
import SafariActivity

class SafariActivityTests: XCTestCase {
    func testInit() {
        let activity = SafariActivity()
        XCTAssertEqual(activity.activityType?.rawValue, "SafariActivity")
        XCTAssertEqual(activity.activityTitle, "Open in Safari")
        XCTAssertNotNil(activity.activityImage)
    }
}
