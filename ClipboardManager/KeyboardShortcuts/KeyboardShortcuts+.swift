//
//  KeyboardShortcuts+.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/5/23.
//

import Foundation
import KeyboardShortcuts

extension KeyboardShortcuts.Name {
    static let popup = Self("popup", default: Shortcut(.c, modifiers: [.command, .shift]))
    
    static let nextPinboard = Self("nextPinboard", default: Shortcut(.rightBracket, modifiers: [.command]))
    
    static let prevPinboard = Self("prevPinboard", default: Shortcut(.leftBracket, modifiers: [.command]))

}
