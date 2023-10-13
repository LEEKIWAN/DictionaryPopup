//
//  SettingsViewController.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/12/23.
//

import Cocoa
import KeyboardShortcuts
import SwiftyUserDefaults
import LaunchAtLogin

class SettingsViewController: NSWindowController {

    @IBOutlet weak var popupContainerView: NSView!

    @IBOutlet weak var launchAtLoginButton: NSButton!
    @IBOutlet weak var textField: NSTextField!
    
    
    private let popupRecorder = KeyboardShortcuts.RecorderCocoa(for: .popup)

    override func windowDidLoad() {
        super.windowDidLoad()

        
        popupContainerView.addSubview(popupRecorder)
        popupRecorder.frame = popupContainerView.bounds
        
        updateStates()
    }
    
    
    
    func updateStates() {
        launchAtLoginButton.state = LaunchAtLogin.isEnabled ? .on : .off
        textField.stringValue = Defaults.customUrl
    }
    
    
    @IBAction func onAutoStartCheckChanged(_ sender: NSButton) {        
        let isEnabled = sender.state == .on
        
        LaunchAtLogin.isEnabled = isEnabled
    }
    
    
}

extension SettingsViewController: NSControlTextEditingDelegate {
//    textfield
    func controlTextDidChange(_ obj: Notification) {
        
        Defaults.customUrl = textField.stringValue
    }
}
