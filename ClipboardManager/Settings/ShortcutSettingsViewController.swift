//
//  ShortcutSettingsViewController.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/6/23.
//

import Cocoa
import KeyboardShortcuts
import Settings

class ShortcutSettingsViewController: NSViewController, SettingsPane {
    
    let paneIdentifier = Settings.PaneIdentifier.general
    let paneTitle = "단축키"
    let toolbarItemIcon = NSImage(systemSymbolName: "gearshape", accessibilityDescription: "General settings")!

    
    override var nibName: NSNib.Name? { "ShortcutSettingsViewController" }

    
    
    @IBOutlet weak var popupContainerView: NSView!
    @IBOutlet weak var nextContainerView: NSView!

    
    let popupRecorder = KeyboardShortcuts.RecorderCocoa(for: .popup)
    
    let nextPinboardRecorder = KeyboardShortcuts.RecorderCocoa(for: .nextPinboard)
    let pevPinboardRecorder = KeyboardShortcuts.RecorderCocoa(for: .prevPinboard)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupContainerView.addSubview(popupRecorder)
        nextContainerView.addSubview(nextPinboardRecorder)
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        popupRecorder.frame = popupContainerView.bounds
        nextPinboardRecorder.frame = nextContainerView.bounds
    }

    
}
