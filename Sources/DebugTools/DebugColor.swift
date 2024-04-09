//
//  DebugColor.swift
//  
//
//  Created by Lucas C Barros on 2024-04-08.
//

import UIKit

enum DebugColor {
    case redScale, blueScale, greenScale, grayScale, pinkScale, yellowScale, cyanScale
    
    func color(_ levelFraction: CGFloat) -> UIColor {
        let step = (levelFraction) * 255.0
        
        switch self {
        case .redScale:
            return UIColor(red: step/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        case .blueScale:
            return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: step/255.0, alpha: 1.0)
        case .greenScale:
            return UIColor(red: 0.0/255.0, green: step/255.0, blue: 0.0/255.0, alpha: 1.0)
            
        case .pinkScale:
            return UIColor(red: 255.0/255.0, green: step/255.0, blue: 255.0/255.0, alpha: 1.0)
        case .yellowScale:
            return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: step/255.0, alpha: 1.0)
        case .cyanScale:
            return UIColor(red: step/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            
        case .grayScale:
            return UIColor(red: step/255.0, green: step/255.0, blue: step/255.0, alpha: 1.0)
        }
    }
}
