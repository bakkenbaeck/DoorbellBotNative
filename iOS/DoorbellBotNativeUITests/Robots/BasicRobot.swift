//
//  BasicRobot.swift
//  DoorbellBotNativeUITests
//
//  Created by Ellen Shapiro on 11/5/18.
//  Copyright © 2018 Bakken &/ Bæck. All rights reserved.
//

import Foundation

protocol BasicRobot {
    func confirmViewVisibleWith(accessibilityLabel: String,
                                file: StaticString,
                                line: UInt)

    func confirmViewVisibleWith(accessiblityIdentifier: String,
                                file: StaticString,
                                line: UInt)
}
