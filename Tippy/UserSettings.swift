//
//  UserSettings.swift
//  Tippy
//
//  Created by Fabien Renaud on 9/18/16.
//  Copyright © 2016 Fabien Renaud. All rights reserved.
//

import Foundation

class UserSettings {
    
    public static let instance = UserSettings()
    
    var darkTheme: Bool
    var defaultTip: Int
    
    private init() {
        let store = UserDefaults.standard
        
        self.darkTheme = (store.object(forKey: "tippy.settings.darkTheme") ?? false) as! Bool
        self.defaultTip = (store.object(forKey: "tippy.settings.defaultTip") ?? 20) as! Int
    }
    
    func save() {
        let store = UserDefaults.standard
        
        store.set(defaultTip, forKey: "tippy.settings.defaultTip")
        store.set(darkTheme, forKey: "tippy.settings.darkTheme")
        store.synchronize()
    }
}
