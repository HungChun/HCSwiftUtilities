//
//  HCDateExtension.swift
//  TrainSchedule
//
//  Created by HungChun on 2017/12/1.
//  Copyright © 2017年 TSUMII STUDIO. All rights reserved.
//

import Foundation
public enum TimeDateUnit
{
    case Day,Hour,Minute,Second
}
extension Date {
    public static func format(formatString:String,dateString:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter.date(from: dateString)!
    }
    
    public var year: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.year, from: self)
    }
    
    public var month: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.month, from: self)
    }
    
    public var day: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.day, from: self)
    }
    
    public var hour: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.hour, from: self)
    }
    
    public var minute: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.minute, from: self)
    }
    
    public var second: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.second, from: self)
    }
    
    public func add(unit:TimeDateUnit,mount:Int) -> Date {
        return self.addingTimeInterval(Double(increaseTime(unit: unit) * mount))
    }
    
    public func subtract(unit:TimeDateUnit,mount:Int) -> Date {
        return self.addingTimeInterval(-Double(increaseTime(unit: unit) * mount))
    }
    
    public func increaseTime(unit:TimeDateUnit) -> Int {
        var increase = 0
        switch unit {
        case .Day:
            increase = 24 * 60 * 60
        case .Hour:
            increase = 60 * 60
        case .Minute:
            increase = 60
        case .Second:
            increase = 1
        }
        return increase;
    }
    
    public func toString(format:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
