import XCTest

import PackageTests

var tests = [XCTestCaseEntry]()
tests += PackageTests.allTests()
XCTMain(tests)
