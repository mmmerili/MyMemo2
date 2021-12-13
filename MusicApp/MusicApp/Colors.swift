//
//  Colors.swift
//  MusicApp
//
//  Created by iosdev on 7.12.2021.
//
import Foundation
import UIKit

class ColorDetails : ObservableObject{
    //background
    public let upperBlue = (hexStringToUIColor(hex: "#24578a"))
    public let middleBlue = (hexStringToUIColor(hex: "#d1deeb"))
    public let downBlue = (hexStringToUIColor(hex: "#24578a"))
    
    //boxes
    public let startBox = (hexStringToUIColor(hex: "#3e8dd6"))
    public let startBorder = (hexStringToUIColor(hex: "#e6f5fa"))
    public let startShadow = (hexStringToUIColor(hex: "#4c749c"))
    
    public let middleBox1 = (hexStringToUIColor(hex: "#002964"))
    public let middleBox2 = (hexStringToUIColor(hex: "#7493BC"))
    public let middleBox3 = (hexStringToUIColor(hex: "#E6F4F1"))
    
    public let box4 = (hexStringToUIColor(hex: "#1d4a8a"))
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
