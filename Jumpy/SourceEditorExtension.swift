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
        return [Jump.upShort, .downShort, .upLong, .downLong].map { jump in
            var dict = [XCSourceEditorCommandDefinitionKey: String]()
            dict[XCSourceEditorCommandDefinitionKey.classNameKey] = SourceEditorCommand.className()
            dict[.identifierKey] = identifierPrefix + jump.rawValue
            let lines = jump == .upShort || jump == .downShort ? Jump.shortValue : Jump.longValue
            dict[.nameKey] = "Jump \(jump == .upShort || jump == .upLong ? "Up" : "Down") \(lines) Lines"
            return dict as [XCSourceEditorCommandDefinitionKey: Any]
        }
    }

}
