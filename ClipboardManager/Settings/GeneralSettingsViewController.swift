//
//  ViewController.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/5/23.
//

import Cocoa
import KeyboardShortcuts
import Settings

final class GeneralSettingsViewController: NSViewController, SettingsPane {

    let paneIdentifier = Settings.PaneIdentifier.general
    let paneTitle = "일반"
    let toolbarItemIcon = NSImage(systemSymbolName: "gearshape", accessibilityDescription: "General settings")!

    
    override var nibName: NSNib.Name? { "GeneralSettingsViewController" }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

