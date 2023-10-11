//
//  DictionaryType.swift
//  ClipboardManager
//
//  Created by 이기완 on 10/11/23.
//

import Foundation
import SwiftyUserDefaults

enum DictionaryType: String, CaseIterable, DefaultsSerializable {
    
    case naver
    case daum
    case custom
    
    
    public var urlString: String {
        switch self {
        case .naver: return "http://endic.naver.com/popManager.nhn?m=miniPopMain"
        case .daum: return "http://small.dic.daum.net/"
        case .custom: return "http://m.dic.naver.com/"
        }
    }
    
    public var title: String {
        switch self {
        case .naver: return "네이버"
        case .daum: return "다음"
        case .custom: return "커스텀"
        }
    }
    
    
    static func title(_ title: String) -> DictionaryType? {
        if title == DictionaryType.naver.title {
            return DictionaryType(rawValue: "naver")
        } else if title == DictionaryType.daum.title {
            return DictionaryType(rawValue: "daum")
        } else if title == DictionaryType.custom.title {
            return DictionaryType(rawValue: "custom")
        }
        
        return nil
    }
    
//    public var URLPattern: String {
//        switch self {
//        case .naver: return "[a-z]+(?=\\.naver\\.com)"
//        case .daum: return "(?<=[?&]dic=)[a-z]+"
//        case .naverMobile: return "(?<=m\\.)[a-z]+(?=\\.naver\\.com)"
//        }
//    }
//    
//    public var inputFocusingScript: String {
//        switch self {
//        case .naver: return "ac_input.focus(); ac_input.select()"
//        case .daum: return "q.focus(); q.select()"
//        case .naverMobile: return "ac_input.focus(); ac_input.select()"
//        }
//    }
    
}
