//
//  ExcludedStubTest.swift
//  Cuckoo
//
//  Created by Arjan Duijzer on 29/12/2017.
//  Copyright © 2017 Brightify. All rights reserved.
//

import XCTest

class ExcludedStubTest: XCTestCase {

    func testClassAvailability() {
        XCTAssertNotNil(ExcludedTestClass())

#if os(iOS)
        XCTAssertNotNil(NSClassFromString("Cuckoo_iOSTests.ExcludedTestClass"))
        XCTAssertNil(NSClassFromString("Cuckoo_iOSTests.MockExcludedTestClass"))
#else
        XCTAssertNotNil(NSClassFromString("Cuckoo_macOSTests.ExcludedTestClass"))
        XCTAssertNil(NSClassFromString("Cuckoo_macOSTests.MockExcludedTestClass"))
#endif
        XCTAssertNotNil(IncludedTestClass())
        XCTAssertNotNil(MockIncludedTestClass())
    }

    func testProtocolAvailability() {
        XCTAssertNotNil(MockIncludedProtocol())

#if os(iOS)
        XCTAssertNil(NSClassFromString("Cuckoo_iOSTests.MockExcludedProtocol"))
#else
        XCTAssertNil(NSClassFromString("Cuckoo_macOSTests.MockExcludedProtocol"))
#endif
    }

}
