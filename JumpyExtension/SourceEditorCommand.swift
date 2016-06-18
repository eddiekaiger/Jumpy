//
//  SourceEditorCommand.swift
//  JumpyExtension
//
//  Created by Eddie Kaiger on 6/17/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: (NSError?) -> Void ) -> Void {

        defer {
            completionHandler(nil)
        }

        guard let jump = Jump(rawValue: invocation.commandIdentifier.components(separatedBy: ".").last!) else { return }

        let selectedRange = invocation.buffer.selections[0] as! XCSourceTextRange
        let startLine = selectedRange.start.line
        let newSelection = XCSourceTextRange()

        // Determine new line number
        let newLine: Int
        switch jump {
        case .upShort: newLine = min(startLine - Jump.shortValue, 0)
        case .downShort: newLine = startLine + Jump.shortValue
        case .upLong: newLine = min(startLine - Jump.longValue, 0)
        case .downLong: newLine = startLine + Jump.longValue
        }

        // Set new cursor position
        newSelection.start = XCSourceTextPosition(line: newLine, column: selectedRange.start.column)
        newSelection.end = newSelection.start
        invocation.buffer.selections.setArray([newSelection])
    }
    
}
