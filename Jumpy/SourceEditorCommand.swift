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

    var lastTextPosition: XCSourceTextPosition?
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) -> Void {

        defer {
            completionHandler(nil)
        }

        guard let lastComponent = invocation.commandIdentifier.components(separatedBy: ".").last else { return }

        switch lastComponent {
        case Jump.customizeIdentifier:
            break // TODO: implement

        default:
            guard let jump = Jump(rawValue: lastComponent) else { return }

            let selectedRange = invocation.buffer.selections[0] as! XCSourceTextRange
            let startLine = selectedRange.start.line
            let newSelection = XCSourceTextRange()

            // Determine new line number
            let newLine: Int
            switch jump {
            case .upShort: newLine = max(startLine - Jump.shortValue, 0)
            case .downShort: newLine = startLine + Jump.shortValue
            case .upLong: newLine = max(startLine - Jump.longValue, 0)
            case .downLong: newLine = startLine + Jump.longValue
            }

            // Set new cursor position
            let position = XCSourceTextPosition(line: newLine, column: selectedRange.start.column)
            newSelection.start = position
            newSelection.end = position
            invocation.buffer.selections.setArray([newSelection])

            lastTextPosition = position
        }
    }
    
}
