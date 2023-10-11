//
//  PopupViewController.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/10/23.
//

import Cocoa
import WebKit
import SwiftyUserDefaults

class PopupViewController: NSViewController {

    @IBOutlet weak var comboButton: NSComboButton!
    @IBOutlet weak var comboMenu: NSMenu!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        reload()
    }
        
    func reload() {
        let url = Defaults.dictinoaryType.urlString
        
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
            
            print(url)
        }
        print("reloaded")
    }

    
    @IBAction func onDictionaryChanged(_ sender: NSMenuItem) {
        guard let dictionaryType = DictionaryType.title(sender.title) else { return }
        Defaults.dictinoaryType = dictionaryType
        reload()
        
        
        print("onDictionaryChanged")
    }
    
    @IBAction func onHomeTapped(_ sender: NSButton) {
        reload()
    }
    
    @IBAction func onSettingTapped(_ sender: NSButton) {
        guard let appDelegate = (NSApplication.shared.delegate) as? AppDelegate else { return }        
        appDelegate.presentSettingViewController()
    }
}
