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


//extension UIColor {
//    class func uicolorFromHex(_ rgbValue:UInt32, alpha : CGFloat)->UIColor
//
//    {
//        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255.0
//        let blue = CGFloat(rgbValue & 0xFF) / 255.0
//        return UIColor(red:red, green:green, blue:blue, alpha: alpha)
//    }
//}

// Make Circlular Profile Image
extension UIImageView {

    func setRounded() {

        layer.borderWidth = 3
        layer.masksToBounds = false
        layer.borderColor = #colorLiteral(red: 0.4862647008, green: 0.2324722247, blue: 0.3384981067, alpha: 0.8470588235).cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}

//
//     Example how this extension is working
//
//     view1.addShadow([.top, .bottom, .left, .right])
//     view2.addShadow([.top, .bottom, .left, .right], radius: 5.0)
//     view2.backgroundColor = .orange
//
extension UIView {
    func addShadow(to edges: [UIRectEdge], radius: CGFloat = 3.0, opacity: Float = 0.6, color: CGColor = UIColor.black.cgColor, width: CGFloat, height: CGFloat) {

        let fromColor = color
        let toColor = UIColor.clear.cgColor
        let viewFrame = self.frame.size
        for edge in edges {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [fromColor, toColor]
            gradientLayer.opacity = opacity

            switch edge {
            case .top:
                print(frame.size.width)
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: width, height: radius)
            case .bottom:
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.frame = CGRect(x: 0.0, y: height - radius, width: width, height: radius)
            case .left:
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: radius, height: height)
            case .right:
                gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.frame = CGRect(x: width - radius, y: 0.0, width: radius, height: height)
            default:
                break
            }
            self.layer.addSublayer(gradientLayer)
        }
    }

    func removeAllShadows() {
        if let sublayers = self.layer.sublayers, !sublayers.isEmpty {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
    }
}


extension UIView {

    func applyGradient(isVertical: Bool, colorArray: [UIColor], width: CGFloat, height: CGFloat) {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
         
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            //top to bottom
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.insertSublayer(gradientLayer, at: 0)
    }

}



extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
            let url = URL(string: urlString)
            self.image = nil

            // check cached image
            if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
                self.image = cachedImage
                return
            }

            // if not, download image from url
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }

                DispatchQueue.main.async {
                    if let image = UIImage(data: data!) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.image = image
                    }
                }

            }).resume()
        }
}
