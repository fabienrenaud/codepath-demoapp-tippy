//
//  TippyUtil.swift
//  Tippy
//
//  Created by Fabien Renaud on 9/18/16.
//  Copyright © 2016 Fabien Renaud. All rights reserved.
//

import UIKit

class TippyUtil {
    
    private static let tips: [Int] = [15,18,20,25]
    
    private init() {
    }
    
    static func tipIndexToValue(index: Int) -> Int {
        return tips[index];
    }
    
    static func tipValueToIndex(value: Int) -> Int {
        switch value {
        case 15:
            return 0
        case 18:
            return 1
        case 20:
            return 2
        case 25:
            return 3
        default:
            return 0
        }
    }
    
    /*
     * Hex color to UIColor.
     * Source: http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
     */
    
    static func colorFromHex(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    static func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }

}
