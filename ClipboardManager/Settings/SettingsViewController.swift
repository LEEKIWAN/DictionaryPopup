//
//  SettingsViewController.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/12/23.
//

import Cocoa
import KeyboardShortcuts
import ServiceManagement
import SwiftyUserDefaults

class SettingsViewController: NSWindowController {

    @IBOutlet weak var popupContainerView: NSView!

    @IBOutlet weak var textField: NSTextField!
    private let popupRecorder = KeyboardShortcuts.RecorderCocoa(for: .popup)

    override func windowDidLoad() {
        super.windowDidLoad()

        
        popupContainerView.addSubview(popupRecorder)
        popupRecorder.frame = popupContainerView.bounds
        
        print("windowDidLoad")
    }
    
    
    
    @IBAction func onAutoStartCheckChanged(_ sender: NSButton) {        
        var isAutoLaunchEnabled = sender.state == .on
        
        let launcherAppIdentifier = "kr.xoul.allkdic.LauncherApplication"
        SMLoginItemSetEnabled(launcherAppIdentifier as CFString, isAutoLaunchEnabled)
        
        print(isAutoLaunchEnabled)
        
        Defaults.isAutoLaunchEnabled = isAutoLaunchEnabled
    }
    
    
}

extension SettingsViewController: NSControlTextEditingDelegate {
//    textfield
    func controlTextDidChange(_ obj: Notification) {
        print(textField.stringValue)
    }
}
