//
//  DoorbellBotNativeUITests.swift
//  DoorbellBotNativeUITests
//
//  Created by Ellen Shapiro on 11/5/18.
//  Copyright © 2018 Bakken &/ Bæck. All rights reserved.
//

import XCTest
import EarlGrey

class DoorbellBotNativeUITests: XCTestCase {
    
    private lazy var testRobot: TestRobot = EarlGreyRobot()

    func testEarlGreyIsWorking() {
        self.testRobot.validateTestLabelAppears()
    }
}
