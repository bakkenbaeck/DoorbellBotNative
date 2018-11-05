//
//  Doorbell_bot_NativeTests.swift
//  Doorbell-bot NativeTests
//
//  Created by Anders Skaalsveen on 02/11/2018.
//  Copyright © 2018 Bakken &/ Bæck. All rights reserved.
//

import XCTest
@testable import DoorbellBotNative
import SharedCode

class DoorbellBotNativeTests: XCTestCase {
    
    func testKotlinNativeSeesiOS() {
        XCTAssertTrue(CommonKt.createApplicationScreenMessage().contains("iOS"))
    }
}
