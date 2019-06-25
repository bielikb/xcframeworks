import XCTest

import SwiftPackageTests

var tests = [XCTestCaseEntry]()
tests += SwiftPackageTests.allTests()
XCTMain(tests)
