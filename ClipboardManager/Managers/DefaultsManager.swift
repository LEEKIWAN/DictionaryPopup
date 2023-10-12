//
//  UserDefaultsManager.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/11/23.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    var dictinoaryType: DefaultsKey<DictionaryType> { .init("dictinoaryType", defaultValue: .naver) }
    
    var isAutoLaunchEnabled: DefaultsKey<Bool> { .init("isAutoLaunchEnabled", defaultValue: false) }
    
}

