//
//  EarlGreyRobot.swift
//  DoorbellBotNativeUITests
//
//  Created by Ellen Shapiro on 11/5/18.
//  Copyright © 2018 Bakken &/ Bæck. All rights reserved.
//

import XCTest
import EarlGrey

class EarlGreyRobot {
    
    private func earlFromFile(file: StaticString, line: UInt) -> EarlGreyImpl {
        return EarlGreyImpl.invoked(fromFile: file.description, lineNumber: line)
    }
    
    private func viewWith(accessibilityLabel label: String,
                          file: StaticString,
                          line: UInt) -> GREYElementInteraction {
        // Accessibility replaces newlines with spaces.
        let labelWithoutNewlines = label.replacingOccurrences(of: "\n", with: " ")
        
        return self.earlFromFile(file: file, line: line)
            .selectElement(with: grey_allOf([
                grey_accessibilityLabel(labelWithoutNewlines),
                ]))
            .atIndex(0)
    }
    
    private func viewWith(accessibilityIdentifier identifier: String,
                          file: StaticString,
                          line: UInt) -> GREYElementInteraction {
        return earlFromFile(file: file, line: line)
            .selectElement(with: grey_accessibilityID(identifier))
    }
}

extension EarlGreyRobot: BasicRobot {
    func confirmViewVisibleWith(accessibilityLabel: String,
                                file: StaticString,
                                line: UInt) {
        viewWith(accessibilityLabel: accessibilityLabel, file: file, line: line)
            .assert(with: grey_sufficientlyVisible())
    }
    
    func confirmViewVisibleWith(accessiblityIdentifier: String,
                                file: StaticString,
                                line: UInt) {
        viewWith(accessibilityIdentifier: accessiblityIdentifier, file: file, line: line)
            .assert(with: grey_sufficientlyVisible())
    }
}

// MARK: - Earl Grey Weidrness

/// Extensions for accessing weirdly annotated objc things
extension GREYInteraction {
    @discardableResult public func assert(with matcher: @autoclosure () -> GREYMatcher) -> Self {
        return __assert(with: matcher())
    }
    
    // swiftlint:disable:next implicitly_unwrapped_optional - this is coming from a library.
    @discardableResult public func assert(
        _ matcher: @autoclosure () -> GREYMatcher,
        error: UnsafeMutablePointer<NSError?>!
        ) -> Self {
        return __assert(with: matcher(), error: error)
    }
    
    // swiftlint:disable:next implicitly_unwrapped_optional - this is coming from a library.
    @discardableResult public func perform(_ action: GREYAction!) -> Self {
        return __perform(action)
    }
}

// MARK: - Robot Mixins

extension EarlGreyRobot: TestRobot {}
