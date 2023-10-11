//
//  AppDelegate.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/5/23.
//

import Cocoa
import Settings

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    var statusBarItem: NSStatusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let popover = NSPopover()
    
    let controller: PopupViewController = PopupViewController(nibName: "PopupViewController", bundle: nil)
    
    private lazy var panes: [SettingsPane] = [
        GeneralSettingsViewController(),
//        ShortcutSettingsViewController()
    ]
    
    
    private lazy var settingsWindowController = SettingsWindowController(
        panes: panes,
        style: .toolbarItems,
        animated: true,
        hidesToolbarForSingleItem: true
    )
    
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        createStatusBarItem()
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    
    @IBAction func settingsMenuItemActionHandler(_ sender: NSMenuItem) {
        
    }
    
    
    public func presentSettingViewController() {
        settingsWindowController.show()
    }
    
    
}


extension AppDelegate {
    
    func createStatusBarItem() {
        statusBarItem.button?.title = "🌯"
        
        statusBarItem.button?.target = self
        statusBarItem.button?.action = #selector(AppDelegate.cancelBurritoOrder(_:))
        
        
        popover.contentSize = controller.view.frame.size
        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = controller
        
        
    }
    
    
    @objc func cancelBurritoOrder(_ sender: NSButton) {
        popover.show(relativeTo: sender.bounds, of: sender as NSView, preferredEdge: .maxY)
      
    }
    
    
    func close() {
        
    }
}
