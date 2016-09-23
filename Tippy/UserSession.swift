//
//  UserSession.swift
//  Tippy
//
//  Created by Fabien Renaud on 9/18/16.
//  Copyright © 2016 Fabien Renaud. All rights reserved.
//

import Foundation

class UserSession {
    
    static let instance = UserSession()
    
    private let timeToLive: Double = 600.0
    
    var billAmount: String
    var tipPercent: Int
    
    private init() {
        let store = UserDefaults.standard
        var needClear = false
        
        let expiration = (store.object(forKey: "tippy.session.expiration") ?? 0.0) as! TimeInterval
        if (expiration - Date.timeIntervalSinceReferenceDate > 0) {
            self.billAmount = (store.object(forKey: "tippy.session.billAmount") ?? "") as! String
            self.tipPercent = (store.object(forKey: "tippy.session.tipPercent") ?? UserSettings.instance.defaultTip) as! Int
        } else {
            self.billAmount = ""
            self.tipPercent = UserSettings.instance.defaultTip
            needClear = true
        }
        
        if (needClear) {
            clear()
        }
    }
    
    func save() {
        let store = UserDefaults.standard
        
        store.set(billAmount, forKey: "tippy.session.billAmount")
        store.set(tipPercent, forKey: "tippy.session.tipPercent")
        store.set(Date.timeIntervalSinceReferenceDate + timeToLive, forKey: "tippy.session.expiration")
        store.synchronize()
    }
    
    func clear() {
        let store = UserDefaults.standard
        
        store.removeObject(forKey: "tippy.session.billAmount")
        store.removeObject(forKey: "tippy.session.tipPercent")
        store.removeObject(forKey: "tippy.session.expiration")
    }
}
