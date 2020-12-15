//
//  Extension.swift
//  MoviesApp
//
//  Created by Nani Sukma Putri Pratama on 13/12/20.
//

import UIKit
extension UIView{
    func anchor (
        top : NSLayoutYAxisAnchor?,
        bottom : NSLayoutYAxisAnchor?,
        leading : NSLayoutXAxisAnchor?,
        trailing : NSLayoutXAxisAnchor?,
        marginTop : CGFloat,
        marginBottom : CGFloat,
        marginLeading : CGFloat,
        marginTrailing : CGFloat,
        width : CGFloat,
        height : CGFloat,
        centerX : NSLayoutXAxisAnchor?,
        centerY : NSLayoutYAxisAnchor?,
        marginFromCenterX : CGFloat,
        marginFromCenterY : CGFloat
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { self.topAnchor.constraint(equalTo: top, constant: marginTop).isActive = true }
        if let bottom = bottom { self.bottomAnchor.constraint(equalTo: bottom, constant: marginBottom).isActive = true }
        if let leading = leading { self.leadingAnchor.constraint(equalTo: leading, constant: marginLeading).isActive = true }
        if let trailing = trailing { self.trailingAnchor.constraint(equalTo: trailing, constant: marginTrailing).isActive = true }

        if width != 0 { widthAnchor.constraint(equalToConstant: width).isActive = true}
        if height != 0 { heightAnchor.constraint(equalToConstant: height).isActive = true}

        if let centerX = centerX { self.centerXAnchor.constraint(equalTo: centerX, constant: marginFromCenterX).isActive = true }
        if let centerY = centerY { self.centerYAnchor.constraint(equalTo: centerY, constant: marginFromCenterY).isActive = true }
    }

}
