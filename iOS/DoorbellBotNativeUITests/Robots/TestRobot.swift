//
//  TestRobot.swift
//  DoorbellBotNativeUITests
//
//  Created by Ellen Shapiro on 11/5/18.
//  Copyright © 2018 Bakken &/ Bæck. All rights reserved.
//

import Foundation
import SharedCode

protocol TestRobot: BasicRobot {}

extension TestRobot {
    
    @discardableResult
    func validateTestLabelAppears(file: StaticString = #file, line: UInt = #line) -> TestRobot {
        confirmViewVisibleWith(accessibilityLabel: CommonKt.createApplicationScreenMessage(),
                               file: file,
                               line: line)
        return self
    }
}
