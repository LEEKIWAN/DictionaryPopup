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

    private lazy var panes: [SettingsPane] = [
        ViewController()
    ]

    
    private lazy var settingsWindowController = SettingsWindowController(
        panes: panes,
        style: .toolbarItems,
        animated: true,
        hidesToolbarForSingleItem: true
    )


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        print("Hello")
        
        settingsWindowController.show()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


    
    

}

