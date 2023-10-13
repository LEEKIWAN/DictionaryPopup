//
//  AppDelegate.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/5/23.
//

import Cocoa
import KeyboardShortcuts

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    var statusBarItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let popover = NSPopover()
    
    let popupController: PopupViewController = PopupViewController(nibName: "PopupViewController", bundle: nil)
    let settingViewController = SettingsViewController(windowNibName: "SettingsViewController")
    
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        createStatusBarItem()
        startToObserveShortcuts()
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    
    @IBAction func settingsMenuItemActionHandler(_ sender: NSMenuItem) {
        
    }
    
    public func startToObserveShortcuts() {
        KeyboardShortcuts.onKeyDown(for: .popup) { [unowned self] in
            showPopupViewController(statusBarItem.button!)
        }
    }
    
    // MARK: - Show
    
    public func showSettingViewController() {
        settingViewController.window?.level = .screenSaver
        
        if settingViewController.window?.isVisible == false {
            settingViewController.window?.center()
        }
        
        settingViewController.updateStates()
        settingViewController.showWindow(nil)
    }
    
    
    @objc func showPopupViewController(_ sender: NSButton) {
        if popover.isShown {
            popover.close()
        } else {
            popover.show(relativeTo: sender.bounds, of: sender as NSView, preferredEdge: .maxY)
        }
      
    }
    
}


extension AppDelegate {
    
    func createStatusBarItem() {
        
        let icon = NSImage(named: "statusicon_default")

//        let icon = NSImage(systemSymbolName: "character.book.closed", accessibilityDescription: nil)?.withSymbolConfiguration(.init(pointSize: 11, weight: .medium, scale: .large))
        
        icon?.isTemplate = true
        statusBarItem.button?.image = icon
        
        
        
        statusBarItem.button?.target = self
        statusBarItem.button?.action = #selector(AppDelegate.showPopupViewController(_:))
                
        popover.contentSize =  popupController.view.frame.size
        
        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = popupController
    }
   
    
    
    func close() {
        
    }
}
