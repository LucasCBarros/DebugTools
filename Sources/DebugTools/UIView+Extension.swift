//
//  UIView+Extension.swift
//
//
//  Created by Lucas C Barros on 2024-04-08.
//
import UIKit

extension UIView {
    
    func debugMode(subLevels: Int = 5,
                   contrast: Int = 1,
                   debugColor: DebugColor = .redScale) {
        
        debugSubView(subLevels: subLevels,
                     currentLevel: subLevels,
                     contrast: contrast,
                     debugColor: debugColor,
                     in: self)
    }
    
    private func debugSubView(subLevels: Int,
                              currentLevel: Int,
                              contrast: Int,
                              debugColor: DebugColor,
                              in subview: UIView) {
        
        for subView in self.subviews {
            let maxLevel = CGFloat(subLevels)
            let current = CGFloat(currentLevel)
            let contrastFraction = CGFloat(contrast)/maxLevel
            
            subView.backgroundColor = debugColor.color((current/maxLevel) + contrastFraction)
            
            if subLevels < 0 {
                debugSubView(subLevels: subLevels,
                             currentLevel: subLevels-1,
                             contrast: contrast,
                             debugColor: debugColor,
                             in: subView)
            }
        }
    }
}
