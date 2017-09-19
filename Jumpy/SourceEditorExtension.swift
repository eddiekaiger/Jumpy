//
//  SourceEditorExtension.swift
//  JumpyExtension
//
//  Created by Eddie Kaiger on 6/17/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation
import XcodeKit

private let identifierPrefix = "com.eddiekaiger.Jumpy.JumpyExtension.SourceEditorCommand."

class SourceEditorExtension: NSObject, XCSourceEditorExtension {

    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {

        let jumps: [[XCSourceEditorCommandDefinitionKey: Any]] = [Jump.upShort, .downShort, .upLong, .downLong].map { jump in
            var dict = [XCSourceEditorCommandDefinitionKey: String]()
            dict[.classNameKey] = SourceEditorCommand.className()
            dict[.identifierKey] = identifierPrefix + jump.rawValue
            let lines = jump == .upShort || jump == .downShort ? Jump.shortValue : Jump.longValue
            dict[.nameKey] = "Jump \(jump == .upShort || jump == .upLong ? "Up" : "Down") \(lines) Lines"
            return dict as [XCSourceEditorCommandDefinitionKey: Any]
        }

        var customizeItem = [XCSourceEditorCommandDefinitionKey: String]()
        customizeItem[.classNameKey] = SourceEditorCommand.className()
        customizeItem[.identifierKey] = identifierPrefix + Jump.customizeIdentifier
        customizeItem[.nameKey] = "Customize..."

        return jumps /* + [customizeItem]*/ // TODO: Add when ready
    }

}
