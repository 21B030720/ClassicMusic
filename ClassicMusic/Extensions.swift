//
//  Extensions.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 24.10.2023.
//

import Foundation
import UIKit

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}


extension UIColor {
    class func uicolorFromHex(_ rgbValue:UInt32, alpha : CGFloat)->UIColor

    {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0xFF) / 255.0
        return UIColor(red:red, green:green, blue:blue, alpha: alpha)
    }
}

extension UIImageView {
    
    func setRounded() {
        
        layer.borderWidth = 3
        layer.masksToBounds = false
        layer.borderColor = #colorLiteral(red: 0.4862647008, green: 0.2324722247, blue: 0.3384981067, alpha: 0.8470588235).cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
